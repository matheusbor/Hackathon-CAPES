import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:capes/view/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ChatBot extends StatefulWidget{
  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  String url = "";
  var data;
  String QueryText = 'Query';

  TextEditingController textController = TextEditingController();

  List sentMessages= ["ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
     "ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "ola chatgptaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
  ];

  List receivedMessages = [
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "oi filhoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",

  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(
        height: 512,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MaterialTheme.personalizatedLight().surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 4,
            color: MaterialTheme.personalizatedLight().primary,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              leading: Icon(Icons.chat),
              backgroundColor: MaterialTheme.personalizatedLight().secondary,
              title: Text("Assistente Capes"),
              actions: [
                IconButton(onPressed: (){
                  //Navigator.pop()
                }, icon: Icon(Icons.close))
              ],
            ),
            SizedBox(height: 16,),

            // Expanded(
            //   child:
            //   sentMessages.isNotEmpty
            //       ? ListView(
            //     children: sentMessages.map((value) =>
            //         BoxMessage(origin: true, text: value.toString())
            //     ).toList(),
            //   )
            //       : SizedBox.shrink(),
            // ),
            Expanded(
              child: sentMessages.isNotEmpty
                  ? ListView.builder(
                itemCount: sentMessages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 4, right: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, // Para alinhar dentro do Column
                      children: [
                        // Mensagem enviada (alinhada à esquerda)
                        Align(
                          alignment: Alignment.centerRight,
                          child: BoxMessage(
                            origin: true,
                            text: sentMessages[index].toString(),
                          ),
                        ),
                        // Mensagem recebida (alinhada à direita, se existir)
                        if (index < receivedMessages.length)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: BoxMessage(
                              origin: false,
                              text: receivedMessages[index].toString(),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              )
                  : SizedBox.shrink(),
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
              child:
              TextField(
                controller: textController,
                onChanged: (value) {
                  QueryText = value; // Captura o texto digitado.
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 4),
                  hintText: "Pergunte alguma coisa...",
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.send),
                    onTap: () async {
                      if (QueryText.isNotEmpty) {
                        // Adiciona a mensagem enviada
                        setState(() {
                          sentMessages.add(QueryText);
                        });

                        // Define a URL
                        String apiUrl = "urldoflask/$QueryText";
                        textController.clear();
                        try {
                          // Chama o servidor
                          data = await Getdata(apiUrl);
                          var decoded = jsonDecode(data);

                          // Adiciona a resposta ao receivedMessages
                          setState(() {
                            receivedMessages.add(decoded);
                          });
                        } catch (error) {
                          print("Erro na requisição: $error");
                          setState(() {
                            receivedMessages.add("Erro: Não foi possível obter a resposta.");
                          });
                        }
                      }
                    },
                  ),
                ),
              ),


            ),

          ],
        )),
    );
  }
}

Future Getdata(url) async {
  http.Response Response = await http.get(url);
  return Response.body;
}


class BoxMessage extends StatelessWidget{

  BoxMessage({super.key, required bool origin, required String text}):
  isMySide = origin,
  message = text;

  bool isMySide;
  String message;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.only(left: 4, right: 4),
        alignment: Alignment.center,
        height: 32,
      
        decoration: BoxDecoration(
          color: isMySide? Colors.green:Colors.grey,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isMySide? Colors.green:Colors.grey,
          )
        ),
        child: Text(message),
      
      ),
    );
  }

}