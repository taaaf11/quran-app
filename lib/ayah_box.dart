import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'utils.dart';

class AyahBox extends StatelessWidget {
  final int surah;
  final int ayah;

  const AyahBox({super.key, required this.surah, required this.ayah});

  Future<Map<String, dynamic>> _fetchAyahText() async {
    var uri = Uri.parse(
        'https://api.quran.com/api/v4/quran/verses/code_v1/?verse_key=$surah:$ayah');
    var response = await http.get(uri);

    return jsonDecode(response.body)['verses'][0];
  }

  Future<String> _fetchAyahTranslation() async {
    var uri = Uri.parse(
        'https://api.quran.com/api/v4/verses/by_key/$surah:$ayah?translations=95');
    var response = await http.get(uri);

    return jsonDecode(response.body)['verse']['translations'][0]['text'];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).colorScheme.onSurface,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$surah:$ayah'),
                FutureBuilder(
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
                            width: MediaQuery.of(context).size.width - 200,
                            child: Text(
                              snapshot.data!['code_v1'],
                              style: TextStyle(
                                fontFamily: '${snapshot.data!['v1_page']}.TTF',
                                fontSize: 40,
                              ),
                              textDirection: TextDirection.rtl,
                              softWrap: true,
                            ),
                          );
                        }
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
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
                            width: MediaQuery.of(context).size.width - 200,
                            child: Text(
                              removeMarkupTags(snapshot.data!),
                              style: TextStyle(
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.left,
                              softWrap: true,
                            ),
                          );
                        }
                    }
                  },
                ),
              ],
            ),
          ],
          // ),)
        ),
      ),
    );
  }
}
