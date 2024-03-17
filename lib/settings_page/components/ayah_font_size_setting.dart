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
      children: [
        Text('Font Size of Quran text'),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(
                  () {
                    fontsState.decreaseArabicFontSize();
                    prefs.setDouble(
                        'arabicFontSize', fontsState.arabicFontSize);
                  },
                );
              },
              icon: Icon(Icons.remove),
            ),
            Text(fontsState.arabicFontSize.toString()),
            IconButton(
              onPressed: () {
                setState(
                  () {
                    fontsState.increaseArabicFontSize();
                    prefs.setDouble(
                        'arabicFontSize', fontsState.arabicFontSize);
                  },
                );
              },
              icon: Icon(Icons.add),
            )
          ],
        )
      ],
    );
  }
}
