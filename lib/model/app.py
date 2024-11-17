from flask import Flask, request, jsonify, session
from flask_cors import CORS
from dotenv import load_dotenv
import os
import json
import openai
import requests

load_dotenv()
openai.api_key = os.getenv("OPENAI_API_KEY")

app = Flask(__name__)
app.secret_key = "supersecretkey"  # necessário para usar sessões
CORS(app)

user_histories = {}

def chat_with_gpt(prompt, history=[]):
    try:
        messages = [{"role": "system", "content": "Você é um assistente virtual..."}]
        messages += history
        messages.append({"role": "user", "content": prompt})

        response = openai.ChatCompletion.create(
            model="gpt-4o-mini",
            messages=messages,
        )
        return response['choices'][0]['message']['content'].strip()
    except Exception as e:
        return f"Erro: {e}"

def consultar_openalex(query):
    base_url = "https://api.openalex.org/works"
    
    params = {
        "search": query,
        "per_page": 5
    }

    response = requests.get(base_url, params=params)
    
    if response.status_code == 200:
        return response.json()
    else:
        return {"error": "Erro ao acessar a API do OpenAlex"}

# http://127.0.0.1:5000/ask?query=Qual+é+o+seu+nome?
@app.route('/ask', methods=['GET'])
def ask():
    query = request.args.get('query', '')
    user_id = request.args.get('user_id', 'default_user')

    if not query:
        return jsonify({"error": "A pergunta é obrigatória!"}), 400

    if user_id not in user_histories:
        user_histories[user_id] = []

    history = user_histories[user_id]
    response = chat_with_gpt(query, history)

    user_histories[user_id].append({"role": "user", "content": query})
    user_histories[user_id].append({"role": "assistant", "content": response})

    return app.response_class(
        response=json.dumps({"response": response}, ensure_ascii=False),
        status=200,
        mimetype='application/json'
    )

# http://127.0.0.1:5000/consultar?query=artificial%20intelligence
@app.route('/consultar', methods=['GET'])
def consultar():
    query = request.args.get('query', default="machine learning", type=str)
    dados = consultar_openalex(query)
    
    if "results" in dados:
        results = []
        for work in dados["results"]:
            work_info = {
                "Título": work['title'],
                "DOI": work['doi'],
                "Ano de Publicação": work['publication_year'],
                "Data de Publicação": work.get("publication_date", "Data não disponível"),
                "Idioma": work.get('language', 'Não especificado'),
                "Licença": work.get("primary_location", {}).get("license", "Não disponível"),
                "Autores e Instituições": [
                    {
                        "Autor": author_info['author']['display_name'],
                        "Instituições": ', '.join([inst['display_name'] for inst in author_info.get('institutions', [])])
                    } for author_info in work.get('authorships', [])
                ],
                "Acesso Aberto": "Sim" if work.get("open_access", {}).get("is_oa", False) else "Não",
                "Número de Citações": work.get('cited_by_count', 'Não disponível'),
                "Tópicos": ', '.join([topic['display_name'] for topic in work.get('topics', [])]),
                "Página de Destino": work.get("primary_location", {}).get("landing_page_url", "Não disponível")
            }
            results.append(work_info)
        
        return jsonify(results)
    else:
        return jsonify({"error": dados.get("error", "Nenhum resultado encontrado.")})

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000, debug=True)
