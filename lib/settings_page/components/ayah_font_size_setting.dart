import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quran_com_clone/notifiers.dart';

class AyahFontSizeSetting extends StatefulWidget {
  const AyahFontSizeSetting({super.key});

  @override
  State<AyahFontSizeSetting> createState() => _AyahFontSizeSettingState();
}

class _AyahFontSizeSettingState extends State<AyahFontSizeSetting> {
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
          'Font Size of Quran text',
          style: TextStyle(fontSize: 17),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    fontsState.decArabicFontSize();
                    prefs.setDouble(
                        'arabicFontSize', fontsState.arabicFontSize);
                  },
                );
              },
              icon: Icon(Icons.arrow_drop_down),
            ),
            Text(
              fontsState.arabicFontSize.toString(),
              style: TextStyle(fontSize: 15),
            ),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    fontsState.incArabicFontSize();
                    prefs.setDouble(
                        'arabicFontSize', fontsState.arabicFontSize);
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
