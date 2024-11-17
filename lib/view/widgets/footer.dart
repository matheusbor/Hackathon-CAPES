import 'package:flutter/cupertino.dart';

class Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(


      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              height: 383,
              child: Image.asset("footer.png")),
          Container(
              height: 96,
              child: Image.asset("footer2.png",))
        ],
      ),
    );
  }
  
}