import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/surah_box.dart';
import 'pages/surah_page/surah_page.dart';
import 'utils.dart';
import 'notifiers.dart';
import 'pages/bookmarks_page/bookmarks_page.dart';
import 'pages/settings_page/settings_page.dart';

void main() async {
  SharedPreferences.setPrefix('taaaf11_quran_com_clone');

  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();

  double arabicFontSize = prefs.getDouble('arabicFontSize') ?? 25;
  double translationFontSize = prefs.getDouble('translationFontSize') ?? 17;
  List<String> bookmarks = prefs.getStringList('ayahBookmarks') ?? [];

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) =>
              FontSizesProvider(arabicFontSize, translationFontSize),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarksProvider(bookmarks: bookmarks),
        ),
        ChangeNotifierProvider(create: (context) => FontsLoaded())
      ],
      child: QuranApp(),
    ),
  );
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran.com Clone App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff2ca4ab),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Comfortaa',
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Quran App'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('Bookmarks'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookmarksPage(),
                      ),
                    );
                  },
                ),
                PopupMenuItem(
                  child: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      ),
                    );
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 230,
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(hintText: 'Surah:Ayah'),
                textAlign: TextAlign.center,
                onSubmitted: (value) {
                  var surah = int.parse(value.split(':')[0]);

                  // check if it's a valid surah
                  surah = (validateSurah(surah)) ? surah : 114;

                  var startAyah = int.parse(value.split(':')[1]);

                  // check if it's a valid ayat of the given surah
                  // if not, give the last ayah of the surah
                  startAyah = (validateAyah(surah, startAyah)) ? 1 : startAyah;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahPage(
                        surahNumber: surah,
                        startAyah: startAyah,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        getCrossAxisCount(MediaQuery.sizeOf(context).width),
                    mainAxisExtent: 87,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 50,
                  ),
                  itemBuilder: (_, index) => Container(
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      child: SurahNameBox(
                        surahNumber: index + 1,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahPage(
                              surahNumber: index + 1,
                              startAyah: 1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  itemCount: 114,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
