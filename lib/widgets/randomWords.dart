import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/randomWordTile.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  Widget _buildSuggetsions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return Consumer<SavedWordPairModel>(builder: (context, savedModel, child) {
      final alreadySaved = savedModel.isAlreadySaved(pair);
      print(savedModel);
      return RandomWordTile(pair, savedModel.changeSaved, alreadySaved);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggetsions();
  }
}

class RandomWords extends StatefulWidget {
  final _saved = <WordPair>[];
  @override
  RandomWordsState createState() => RandomWordsState();
}
