import 'package:flutter/material.dart';

import 'components/ayah_font_size_setting.dart';
import 'components/translation_font_size_setting.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width /
                2, // quarter the screen width
            child: Column(children: [
              AyahFontSizeSetting(),
              SizedBox(height: 30),
              TranslationFontSizeSetting()
            ]),
          ),
        ));
  }
}
