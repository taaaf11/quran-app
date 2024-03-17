import 'package:flutter/material.dart';
import 'package:quran_com_clone/surah_route.dart';

import 'surah_btn.dart';
import 'surah_data.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => SurahButton(
                number: index + 1,
                name: surahData[index + 1]![1],
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahPage(
                        surah: index + 1,
                        surahName: surahData[index + 1]![1],
                        startAyah: 1,
                      ),
                    ),
                  );
                },
              ),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
            ),
          ),
        ],
      ),
    );
  }
}
