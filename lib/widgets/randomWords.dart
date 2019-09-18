import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/randomWordTile.dart';
import 'package:my_app/widgets/savedWords.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  Widget _buildSuggestions() {
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
      return RandomWordTile(pair, savedModel.changeSaved, alreadySaved);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App Random Words Screen'),
        actions: <Widget>[MenuButton()],
      ),
      body: RandomWords(),
    );
  }
}

class MenuButton extends StatelessWidget {
  void _pushSaved(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SavedWords()));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.list),
      onPressed: () => _pushSaved(context),
    );
  }
}
