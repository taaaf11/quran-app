import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quran_com_clone/notifiers.dart';

class TranslationFontSizeSetting extends StatefulWidget {
  const TranslationFontSizeSetting({super.key});

  @override
  State<TranslationFontSizeSetting> createState() =>
      _TranslationFontSizeSettingState();
}

class _TranslationFontSizeSettingState
    extends State<TranslationFontSizeSetting> {
  late SharedPreferences prefs;

  void initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    initSharedPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var fontsState = Provider.of<FontSizesProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Font size of translation',
          style: TextStyle(fontSize: 17),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    fontsState.decTranslationFontSize();
                    prefs.setDouble(
                        'translationFontSize', fontsState.translationFontSize);
                  },
                );
              },
              icon: Icon(Icons.arrow_drop_down),
            ),
            Text(
              fontsState.translationFontSize.toString(),
              style: TextStyle(fontSize: 15),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    fontsState.incTranslationFontSize();
                    prefs.setDouble(
                        'translationFontSize', fontsState.translationFontSize);
                  },
                );
              },
              icon: Icon(Icons.arrow_drop_up),
            )
          ],
        )
      ],
    );
  }
}
