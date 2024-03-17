import 'package:flutter/material.dart';

import 'components/ayah_font_size_setting.dart';
import 'components/translation_font_size_setting.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Column(children: [
          AyahFontSizeSetting(),
          SizedBox(height: 30),
          TranslationFontSizeSetting()
        ]));
  }
}
