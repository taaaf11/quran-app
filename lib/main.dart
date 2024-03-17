import 'package:flutter/material.dart';
import 'package:quran_com_clone/surah_route.dart';

import 'surah_btn.dart';

void main() {
  runApp(const MyApp());
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
          seedColor: const Color(0xff16666f),
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
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: TextField(
                controller: _textEditingController,
                onSubmitted: (value) {
                  var surah = int.parse(value.split(':')[0]);
                  var startAyah = int.parse(value.split(':')[1]);

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
                width: 300,
                child: ListView.separated(
                  itemBuilder: (_, index) => SurahButton(
                    surahNumber: index + 1,
                    onPress: () {
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
