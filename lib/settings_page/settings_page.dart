import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:quran_com_clone/notifiers.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Column(children: [AyahSizeSetting()]));
  }
}

class AyahSizeSetting extends StatefulWidget {
  const AyahSizeSetting({super.key});

  @override
  State<AyahSizeSetting> createState() => _AyahSizeSettingState();
}

class _AyahSizeSettingState extends State<AyahSizeSetting> {
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
