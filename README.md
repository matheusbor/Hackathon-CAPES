# Hackathon - Desafio Portal de Periódicos da Capes 2024

## 🚀 Solução

Este repositório contém a solução desenvolvida por nossa equipe para o **HACKATHON - DESAFIO PORTAL DE PERIÓDICOS DA CAPES 2024**. Nosso projeto integra **inteligência artificial (IA)** e **automação** para melhorar a experiência de busca e interação no portal de periódicos da CAPES. Com tecnologias escaláveis e modernas, criamos um MVP (Produto Mínimo Viável) que inova a forma como os usuários interagem com a plataforma.


## 🎯 Objetivo

Criar uma experiência de usuário fluida, intuitiva e personalizada, otimizando buscas e publicações científicas por meio de integração com IA e ferramentas de automação.


## 🧠 Funcionalidades Principais

1. **Integração com ChatGPT-4omni**:
   - A busca no portal retorna não apenas resultados da base OpenAlex, mas também respostas detalhadas geradas pelo modelo mais atual do ChatGPT.
   - Um chatbot integrado ajuda os usuários a realizar pesquisas e navegar pelo site.

2. **Framework Front-End Flutter**:
   - **Cross-platform**: O projeto atualmente funciona apenas para web, porém ele é composto de um código único que pode ser compilado para web, desktop (Windows, Mac, Linux).
   - Componentes nativos para acessibilidade e usabilidade intuitiva.

3. **Backend em Python com Flask**:
   - API robusta que gerencia consultas ao OpenAlex e integra perguntas/respostas do ChatGPT.
   - Retorno de dados em formato JSON, consumidos pelo front-end.
   - Fácil manutenção e escalabilidade.

4. **Acessibilidade aprimorada**:
   - Componentes acessíveis do Flutter.
   - Integração com o serviço **VLibras** do governo federal para usuários com necessidades especiais.


## 💻 Tecnologias Utilizadas

| Tecnologia       | Finalidade                                     |
|-------------------|-----------------------------------------------|
| **Flutter**       | Desenvolvimento front-end multiplataforma.    |
| **Flask**         | Backend leve e rápido com suporte a APIs.     |
| **OpenAlex**      | Base de dados de periódicos científicos.      |
| **ChatGPT-4omni** | Integração de IA para respostas inteligentes. |
| **VLibras**       | Acessibilidade para usuários com deficiência. |


## 🔥 MVP Desenvolvido

1. **Página Principal do Portal de Periódicos da CAPES**:
   - Design intuitivo e responsivo.
   - Barra de pesquisa com integração de IA.

2. **Página de Busca**:
   - Resultados da base OpenAlex e sugestões inteligentes via ChatGPT.
   - Chatbot interativo integrado à experiência de navegação.


## 🛠️ Como Executar

### Pré-requisitos:
- **Flutter**: [Instalar Flutter](https://flutter.dev/docs/get-started/install)
- **Python** (3.8+): [Instalar Python](https://www.python.org/downloads/)

### Passos:

1. Clone o repositório:
   ```bash
   git clone https://github.com/matheusbor/Hackathon-CAPES.git
   cd portal-periodicos-capes
   ```

2. Instale as dependências do back-end:
   ```bash
   pip install -r requirements.txt
   ```

3. Inicie o servidor Flask:
   ```bash
   python server.py
   python chatbot.py
   ```

4. Configure e execute o front-end Flutter:
   ```bash
   flutter pub get
   flutter run
   ```

## 🤝 Contribuições

Sinta-se à vontade para enviar pull requests ou abrir issues para discutir novas ideias e melhorias.
