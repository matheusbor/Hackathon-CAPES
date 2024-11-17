import 'package:capes/view/widgets/footer.dart';
import 'package:capes/view/widgets/navbar.dart';
import 'package:capes/view/widgets/search.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        NavBar(),
        Search(),
        SizedBox(height: 1024,),

        Footer(),
      ],
    );
  }

}