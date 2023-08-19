import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Food extends StatelessWidget {
  const Food({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(
            "Developed by - @emilianoelano\nemiliswilis.com",
            style: textTheme.labelSmall,
          ),
          trailing: const Icon(Icons.home),
          onTap: () {
            launchUrl(
              Uri.parse(
                  "https://www.linkedin.com/in/emilio-partida-68a6a71b9/"),
              mode: LaunchMode.externalApplication,
            );
          },
        ),
        ListTile(
          title: Text(
            "Designed by - @g4bri3l\ndribbble.com/gabriellll",
            style: textTheme.labelSmall,
          ),
          trailing: const Icon(Icons.home),
          onTap: () {
            launchUrl(
              Uri.parse("https://www.linkedin.com/in/devgabs/"),
              mode: LaunchMode.externalApplication,
            );
          },
        ),
      ],
    );
  }
}
