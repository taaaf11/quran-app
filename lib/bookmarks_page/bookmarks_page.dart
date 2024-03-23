import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_com_clone/components/ayah_box.dart';

import 'package:quran_com_clone/models/ayah_key.dart';
import 'package:quran_com_clone/notifiers.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    var bookmarksState = Provider.of<BookmarksProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: ListView.builder(
        itemBuilder: (context, index) => AyahBox(
          ayahKey: AyahKey.fromString(bookmarksState.bookmarks[index]),
        ),
        itemCount: bookmarksState.bookmarks.length,
      ),
    );
  }
}
