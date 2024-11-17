import 'dart:convert';

import 'package:capes/ViewModel/chatbot.dart';
import 'package:capes/view/screens/search_screen.dart';
import 'package:capes/view/widgets/ia_response.dart';
import 'package:capes/view/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatelessWidget{
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(64),
      decoration: BoxDecoration(
        color: MaterialTheme.personalizatedLight().primary
      ),
      child: SearchBar(
        controller: textEditingController,
      hintText: "Digite o que está procurando...",
        leading: Icon(Icons.search),

        onSubmitted: (value) async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen())
          );
          ChatModel.searchMessage = textEditingController.text;
          String apiUrl = "http://127.0.0.1:5000/ask?query=" + ChatModel.formatMessage(textEditingController.text);

            var data = await Getdata(Uri.parse(apiUrl));
            var decoded = jsonDecode(data);
          print(decoded);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('searchMessage', decoded['response']);
          print(prefs.getString("searchMessage"));
          textEditingController.clear();
        },
      ),
    );
  }

}