import 'package:capes/view/widgets/ia_response.dart';
import 'package:capes/view/widgets/footer.dart';
import 'package:capes/view/widgets/navbar.dart';
import 'package:capes/view/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NavBar(),
          Search(),
          ChatBot(),
          Footer(),

        ],
      ),
    );
  }

}