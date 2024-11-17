import openai
from flask import Flask, request, jsonify
import json
from flask_cors import CORS

openai.api_key = "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"

def chat_with_gpt(prompt, history=[]):
    try:
        messages = [{"role": "system", "content": "Você é um assistente virtual integrado a uma barra de busca, Se apresente como Assistente de busca de periodicos da CAPES alimentado pelo ChatGPT 4. você é feito para responder a pesquisa do usuário como se fosse uma pergunta para você. A busca do usuário é feita na base de dados OpenAlex integrada ao nosso website que reúne milhares de periódicos.Na sua resposta use apenas caracteres simples(Pode usar maiúsculas no início das frases), não use de jeito nenhum caracteres especiais como (Ç, ª, º, °, etc)- não use acentuação de forma alguma(se atente a isso por favor)- não use acentuação de forma alguma- não use acentuação de forma alguma. Input do usuário a seguir:"}]
        messages += [{"role": "user", "content": msg} for msg in history]
        messages.append({"role": "user", "content": prompt})

        response = openai.ChatCompletion.create(
            model="gpt-4o-mini",
            messages=messages,
        )
        return response['choices'][0]['message']['content'].strip()
    except Exception as e:
        return f"Erro: {e}"

app = Flask(__name__)
CORS(app)

# http://127.0.0.1:5000/ask?query=Qual+é+o+seu+nome?
@app.route('/ask', methods=['GET'])
def ask():
    query = request.args.get('query', '')
    if not query:
        return jsonify({"error": "A pergunta é obrigatória!"}), 400

    response = chat_with_gpt(query)

    return app.response_class(
        response=json.dumps({"response": response}, ensure_ascii=False),
        status=200,
        mimetype='application/json'
    )

if __name__ == "__main__":
    app.run(debug=True)
