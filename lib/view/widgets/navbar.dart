import 'package:capes/view/widgets/capes.dart';
import 'package:capes/view/widgets/govbr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 64, right: 64, top: 8, bottom: 8),
      child: Column(
        children: [
          GovBr(),
          SizedBox(
            height: 16,
          ),
          Capes(),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SelectableText(
                "Você tem acesso ao conteúdo gratuito do Portal de Periódicos da CAPES",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Acesso CAFe",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Icon(Icons.arrow_drop_down),
            ],
          )
        ],
      ),
    );
  }

  static void openLink(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Não foi possível abrir o link: $url";
    }
  }
}
