import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWordTile extends StatelessWidget {
  final WordPair _pair;
  final void Function(WordPair) _onTap;
  final bool _alreadySaved;
  final _biggerFont = TextStyle(fontSize: 18.0);
  RandomWordTile(this._pair, this._onTap, this._alreadySaved);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(_pair.asLowerCase, style: _biggerFont),
        trailing: Icon(_alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: _alreadySaved ? Colors.red : null),
        onTap: () {
          _onTap(_pair);
          print(_onTap);
          print(_pair);
        });
  }
}
