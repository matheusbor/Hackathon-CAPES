import 'package:capes/view/widgets/carrossel.dart';
import 'package:capes/view/widgets/footer.dart';
import 'package:capes/view/widgets/navbar.dart';
import 'package:capes/view/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          NavBar(),
          Search(),
          SizedBox(height: 64,),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Alinha os widgets no centro
              crossAxisAlignment: CrossAxisAlignment.center, // Alinha o conteúdo verticalmente no centro
              children: [
                // Primeira coluna com o texto
                Expanded(
                  flex: 2, // Define que o texto ocupará 2 partes da largura
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
                    crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo horizontalmente
                    children: [
                      Container(
                        margin: EdgeInsets.only(left:32),
                        child: Text(
                          "Aqui você encontra conteúdo científico diversificado para deixar sua pesquisa ainda melhor.",
                          style: Theme.of(context).textTheme.headlineMedium,
                          textAlign: TextAlign.start, // Centraliza o texto dentro da coluna
                        ),
                      ),
                    ],
                  ),
                ),

                // Segunda coluna com o carrossel de imagens
                Expanded(
                  flex: 3, // Define que o carrossel ocupará 3 partes da largura
                  child: Column(
                    children: [
                      Image.asset("conteudo6.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16,),
          CarouselImages(),
          SizedBox(height: 128,),
          Footer(),
        ],
      ),
    );
  }

}

void _launchURL() async {
  final Uri url = Uri.parse('https://www.periodicos.capes.gov.br/index.php/sobre/quem-somos.html');

  // Verifica se o link pode ser aberto
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Não foi possível abrir o link $url';
  }
}
