import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'ayah_key.dart';
import 'bookmark_btn.dart';
import 'notifiers.dart';
import 'utils.dart';

class AyahBox extends StatefulWidget {
  final AyahKey ayahKey;

  const AyahBox({super.key, required this.ayahKey});

  @override
  State<AyahBox> createState() => _AyahBoxState();
}

class _AyahBoxState extends State<AyahBox> {
  Future<Map<String, dynamic>> _fetchAyahText() async {
    var uri = Uri.parse(
        'https://api.quran.com/api/v4/quran/verses/code_v1/?verse_key=${widget.ayahKey.encode}');
    var response = await http.get(uri);

    return jsonDecode(response.body)['verses'][0];
  }

  Future<String> _fetchAyahTranslation() async {
    var uri = Uri.parse(
        'https://api.quran.com/api/v4/verses/by_key/${widget.ayahKey.encode}?translations=95');
    var response = await http.get(uri);

    return jsonDecode(response.body)['verse']['translations'][0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    var fontsState = Provider.of<FontSizesProvider>(context);

    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.onSurface,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(widget.ayahKey.encode),
                      BookmarkButton(
                        ayahKey: widget.ayahKey,
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: FutureBuilder(
                    future: _fetchAyahText(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Text('Loading');
                        default:
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return SizedBox(
                              child: Text(
                                snapshot.data!['code_v1'],
                                style: TextStyle(
                                  fontFamily:
                                      '${snapshot.data!['v1_page']}.TTF',
                                  fontSize: fontsState.arabicFontSize,
                                ),
                                textDirection: TextDirection.rtl,
                                softWrap: true,
                              ),
                            );
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 10,
                  child: FutureBuilder(
                    future: _fetchAyahTranslation(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Text('Loading');
                        default:
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return SizedBox(
                              child: Text(
                                removeMarkupTags(snapshot.data!),
                                style: TextStyle(
                                  fontSize: fontsState.translationFontSize,
                                ),
                                textAlign: TextAlign.left,
                                softWrap: true,
                              ),
                            );
                          }
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
