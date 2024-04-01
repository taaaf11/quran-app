import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../models/ayah_key.dart';
import 'bookmark_btn.dart';
import '../notifiers.dart';
import '../utils.dart';
import '../models/ayah_v1.dart';
import 'clickable_text.dart';

class AyahBox extends StatefulWidget {
  final AyahKey ayahKey;

  const AyahBox({super.key, required this.ayahKey});

  @override
  State<AyahBox> createState() => _AyahBoxState();
}

class _AyahBoxState extends State<AyahBox> {
  Future<AyahV1> _fetchAyahTextV1() async {
    var uri = Uri.parse(
        'https://api.quran.com/api/v4/verses/by_key/${widget.ayahKey.encode}?words=true');
    var response = await http.get(uri);

    var responseJson = json.decode(response.body);

    List verse = responseJson['verse']['words'];
    List<Map<String, dynamic>> words =
        verse.map((item) => item as Map<String, dynamic>).toList();

    return AyahV1(words: words);
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
                    future: _fetchAyahTextV1(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Shimmer.fromColors(
                            baseColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.3),
                            highlightColor: Colors.grey.shade500,
                            child: Container(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              width: 320,
                              height: 20,
                            ),
                          );
                        default:
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          } else {
                            return Wrap(
                              textDirection: TextDirection.rtl,
                              children: [
                                for (final word in snapshot.data!.words)
                                  ClickableText(
                                    text: word['code_v1'],
                                    textStyle: TextStyle(
                                      fontFamily: '${word['page_number']}.TTF',
                                      fontSize: fontsState.arabicFontSize,
                                    ),
                                    onPress: () async {
                                      final player = AudioPlayer();
                                      await player.play(UrlSource(
                                          'https://audio.qurancdn.com/'
                                          '${word['audio_url']}'));
                                    },
                                  )
                              ],
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
                          return Shimmer.fromColors(
                            baseColor: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.3),
                            highlightColor: Colors.grey.shade500,
                            child: Container(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              width: 320,
                              height: 20,
                            ),
                          );
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
