import 'package:capes/view/widgets/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GovBr extends StatelessWidget{
  final String url1 = "https://www.gov.br/";
  final String url2 = "https://www.gov.br/capes";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => NavBar.openLink(url1),
            child: Container(
                width: 128,
                child: Image.asset("govbr.png"))
        ),
        SizedBox(width: 8,),
        GestureDetector(
          onTap: () => NavBar.openLink(url2),
          child: Container(
              width: 256,
              child: Text("Ministério da Educação/CAPES",
                style:Theme.of(context).textTheme.titleMedium,)),
        ),
        Spacer(),
        FakeLinks(),
      ],
    );
  }

}


class FakeLinks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2,
      child: Row(
        children: [
          Text("Órgãos do Governo",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: Theme.of(context).textTheme.titleSmall!.fontSize
            ),
          ),
          SizedBox(width: 16,),
          Text("Acesso à Informação",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: Theme.of(context).textTheme.titleSmall!.fontSize
            ),
          ),
          SizedBox(width: 16,),
          Text("Legislação",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: Theme.of(context).textTheme.titleSmall!.fontSize
            ),
          ),
          SizedBox(width: 16,),
          Text("Acessibilidade",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: Theme.of(context).textTheme.titleSmall!.fontSize
            ),
          ),
          SizedBox(width: 16,),
          Icon(Icons.dark_mode),
          SizedBox(width: 16,),
          
          Icon(Icons.person,
            color: Colors.blueAccent,
          ),
          Text("Entrar",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: Theme.of(context).textTheme.titleSmall!.fontSize
            ),
          ),
        ],
      ),
    );
  }

}