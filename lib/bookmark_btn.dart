import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ayah_key.dart';
import 'notifiers.dart';

// ignore: must_be_immutable
class BookmarkButton extends StatefulWidget {
  AyahKey ayahKey;

  BookmarkButton({super.key, required this.ayahKey});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
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
    var bookmarksState = Provider.of<BookmarksProvider>(context);

    return IconButton(
      icon: (!bookmarksState.bookmarks.contains(widget.ayahKey.encode))
          ? Icon(Icons.bookmark_border)
          : Icon(Icons.bookmark),
      onPressed: () {
        setState(
          () {
            (!bookmarksState.bookmarks.contains(widget.ayahKey.encode))
                ? bookmarksState.bookmarks.add(widget.ayahKey.encode)
                : bookmarksState.bookmarks.remove(widget.ayahKey.encode);
          },
        );
      },
    );
  }
}
