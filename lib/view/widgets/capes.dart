import 'package:capes/view/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Capes extends StatelessWidget{
  final String url1 = "https://www.gov.br/capes/pt-br";
  final String url2 = "https://www.periodicos.capes.gov.br/";

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
        GestureDetector(
        onTap: () => NavBar.openLink(url1),
        child: Container(
        width: 128 + 64,
        child: Image.asset("logo-capes.png"))
        ),
        SizedBox(width: 8,),
        GestureDetector(
        onTap: () => NavBar.openLink(url2),
        child: Container(
        width: 128,
        child: Image.asset("icon-capes.png")),
        ),

          Spacer(),
          FakeSections(),

      ],
        );
  }

}

class FakeSections extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2,
      child: Row(
        children: [
            Text("Sobre",
            style: Theme.of(context).textTheme.titleMedium,
            ),
          SizedBox(width: 32,),
          Text("Acervo",
            style: Theme.of(context).textTheme.titleMedium,
            ),
          SizedBox(width: 32,),
          Text("Treinamentos",
            style: Theme.of(context).textTheme.titleMedium,
            ),
          SizedBox(width: 32,),
          Text("Informativos",
            style: Theme.of(context).textTheme.titleMedium,
            ),
          SizedBox(width: 32,),
          Text("Ajuda",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(width: 32,),
          GestureDetector(
            onTap: ()=> Navigator.push,//todo
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("Meu espaço",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          )
        ],
      ),
    );
  }

}


