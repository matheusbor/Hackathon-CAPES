import 'dart:convert';
import 'package:capes/ViewModel/chatbot.dart';
import 'package:http/http.dart' as http;
import 'package:capes/view/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatBot extends StatefulWidget {
  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String url = "";
  var data;
  String QueryText = 'Query';

  TextEditingController textController = TextEditingController();

  List sentMessages = [
    ChatModel.searchMessage,
  ];

  List receivedMessages = [];

  bool isWaitingForResponse = false; // Flag to track if we're waiting for a response

  @override
  void initState() {
    super.initState();
    loadSearchMessage();
  }

  Future<void> loadSearchMessage() async {
    await Future.delayed(Duration(seconds: 5));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedMessage = prefs.getString('searchMessage');
    print("print dentro de laodsearch$storedMessage");

    if (storedMessage != null && storedMessage.isNotEmpty) {
      setState(() {
        receivedMessages.add(storedMessage);
      });
    } else {
      print("Nenhuma mensagem encontrada no SharedPreferences");
    }
  }

  Future<void> clearAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Remove todos os dados
    print('Todos os dados foram removidos');
  }

  @override
  Widget build(BuildContext context) {
    print("print da lista no build $receivedMessages");

    return Container(
      height: 512,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 4,
          color: MaterialTheme.personalizatedLight().primary,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              margin: EdgeInsets.only(bottom: 4),
              child: sentMessages.isNotEmpty
                  ? ListView.builder(
                itemCount: sentMessages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 4, right: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, // Para alinhar dentro do Column
                      children: [
                        // Mensagem enviada
                        Align(
                          alignment: Alignment.centerRight,
                          child: BoxMessage(
                            origin: true,
                            text: sentMessages[index].toString(),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        // Mensagem recebida
                        if (index < receivedMessages.length)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: BoxMessage(
                              origin: false,
                              text: receivedMessages[index].toString(),
                            ),
                          ),
                        SizedBox(height: 8.0),
                      ],
                    ),
                  );
                },
              )
                  : SizedBox.shrink(),
            ),
          ),
          Container(
            height: 32,
            margin: EdgeInsets.only(left: 4, right: 4, bottom: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: MaterialTheme.personalizatedLight().primary,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: textController,
              onChanged: (value) {
                QueryText = value; // Captura o texto digitado.
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 4),
                hintText: "Escreva uma mensagem...",
                suffixIcon: GestureDetector(
                  child: Icon(Icons.send),
                  onTap: () async {
                    if (QueryText.isNotEmpty && !isWaitingForResponse) {
                      // Adiciona a mensagem enviada
                      setState(() {
                        sentMessages.add(QueryText);
                        isWaitingForResponse = true; // Marca que estamos esperando a resposta
                      });
                      // Define a URL
                      String apiUrl = "http://127.0.0.1:5000/ask?query=" + ChatModel.formatMessage(QueryText);
                      textController.clear();
                      try {
                        // Chama o servidor
                        data = await Getdata(Uri.parse(apiUrl));
                        var decoded = jsonDecode(data);

                        // Adiciona a resposta ao receivedMessages
                        setState(() {
                          receivedMessages.add(decoded['response']);
                          isWaitingForResponse = false; // Resposta recebida, permite nova interação
                        });
                      } catch (error) {
                        print("Erro na requisição: $error");
                        setState(() {
                          receivedMessages.add("Erro: Não foi possível obter a resposta.");
                          isWaitingForResponse = false; // Caso ocorra erro, também libera a interação
                        });
                      }
                    }
                  },
                ),
              ),
            ),
          ),
          Divider(height: 3),
          AppBar(
            leading: Icon(
              Icons.auto_awesome,
              color: MaterialTheme.personalizatedLight().primary,
            ),
            title: Text(
              "Resposta gerada por IA",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      ),
    );
  }
}

Future Getdata(url) async {
  http.Response Response = await http.get(url);
  return Response.body;
}

class BoxMessage extends StatelessWidget {
  BoxMessage({super.key, required bool origin, required String text})
      : isMySide = origin,
        message = text;

  bool isMySide;
  String message;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isMySide ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isMySide ? Colors.blue : Colors.grey,
          ),
        ),
        child: Text(message),
      ),
    );
  }
}
