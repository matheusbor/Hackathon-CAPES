import openai
from flask import Flask, request, jsonify
import json

openai.api_key = "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"

def chat_with_gpt(prompt, history=[]):
    try:
        messages = [{"role": "system", "content": "Você é um assistente útil."}]
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
