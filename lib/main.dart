import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_app/widgets/randomWords.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      builder: (context) => SavedWordPairModel(),
      child: MyApp(),
    ));

class RootContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to quiz app', home: RandomWordsScreen());
  }
}

class SavedWordPairModel extends ChangeNotifier {
  final savedWordPair = <WordPair>[];

  UnmodifiableListView<WordPair> get items =>
      UnmodifiableListView(savedWordPair);

  bool isAlreadySaved(WordPair pair) {
    return savedWordPair.contains(pair);
  }

  void changeSaved(WordPair pair) {
    final alreadySaved = isAlreadySaved(pair);
    if (alreadySaved) {
      savedWordPair.remove(pair);
    } else {
      savedWordPair.add(pair);
    }

    notifyListeners();
  }
}
