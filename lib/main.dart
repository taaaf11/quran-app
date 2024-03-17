import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'surah_box.dart';
import 'surah_route.dart';
import 'utils.dart';
import 'notifiers.dart';
import 'settings_page/settings_page.dart';

void main() async {
  SharedPreferences.setPrefix('taaaf11_quran_com_clone');

  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();

  double arabicFontSize = prefs.getDouble('arabicFontSize') ?? 25;
  double translationFontSize = prefs.getDouble('translationFontSize') ?? 17;

  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          FontSizesProvider(arabicFontSize, translationFontSize),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MyHomePage(title: 'Quran App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            icon: Icon(Icons.settings),
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
                onSubmitted: (value) async {
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
                width: 348,
                child: ListView.separated(
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  addAutomaticKeepAlives: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
