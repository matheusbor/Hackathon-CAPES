import 'package:capes/view/widgets/ia_response.dart';
import 'package:capes/view/screens/home_screen.dart';
import 'package:capes/view/screens/search_screen.dart';
import 'package:capes/view/widgets/footer.dart';
import 'package:capes/view/widgets/navbar.dart';
import 'package:capes/view/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(
      TextTheme(
    displayLarge: Theme.of(context).textTheme.displayLarge,
        displayMedium: Theme.of(context).textTheme.displayMedium,
        displaySmall: Theme.of(context).textTheme.displaySmall,
        headlineLarge: Theme.of(context).textTheme.headlineLarge,
        headlineMedium: Theme.of(context).textTheme.headlineMedium,
        headlineSmall: Theme.of(context).textTheme.headlineSmall,
        titleLarge: Theme.of(context).textTheme.titleLarge,
        titleMedium: Theme.of(context).textTheme.titleMedium,
        titleSmall: Theme.of(context).textTheme.titleSmall,
        bodyLarge: Theme.of(context).textTheme.bodyLarge,
        bodyMedium: Theme.of(context).textTheme.bodyMedium,
        bodySmall: Theme.of(context).textTheme.bodySmall,
        labelLarge: Theme.of(context).textTheme.labelLarge,
        labelMedium: Theme.of(context).textTheme.labelMedium,
        labelSmall: Theme.of(context).textTheme.labelSmall,

      )
    );
    return MaterialApp(
      //theme: materialTheme.personalizated(),
      // darkTheme: materialTheme.dark(),
      // themeMode: ThemeMode.system,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/search": (context) => SearchScreen(),
        //"/profile": (context) =>
      },
      // home: SearchScreen(),

    );
  }

}
