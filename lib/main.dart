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
            seedColor: const Color(0xff16666f), brightness: Brightness.dark),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TextField(), // for entering surah:ayah, and other
          NumberBox(number: 1),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SurahPage(
                          surah: 1, surahName: 'al-fatihah', startAyah: 2)));
            },
            child: Text('a'),
          ),
          SizedBox(
            width: screenWidth / 2,
            height: screenHeight / 2,
            child: ListView.builder(
              itemBuilder: (_, index) =>
                  SurahButton(number: index, name: "Al-Fatiha"),
              itemCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
