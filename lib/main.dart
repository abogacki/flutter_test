import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:my_app/widgets/randomWords.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      builder: (context) => SavedWordPairModel(),
      child: RootContainer(),
    ));

class RootContainer extends StatelessWidget {
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _saved = <WordPair>[];

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((pair) {
        return ListTile(title: Text(pair.asPascalCase));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return ListView(children: divided);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to quiz app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
        ),
        body: RandomWords(),
      ),
    );
  }
}

class SavedWordPairModel extends ChangeNotifier {
  final _savedWordPair = <WordPair>[];
  UnmodifiableListView<WordPair> get items =>
      UnmodifiableListView(_savedWordPair);

  bool isAlreadySaved(WordPair pair) {
    return _savedWordPair.contains(pair);
  }

  void changeSaved(WordPair pair) {
    final alreadySaved = isAlreadySaved(pair);
    if (alreadySaved) {
      _savedWordPair.remove(pair);
    } else {
      _savedWordPair.add(pair);
    }

    notifyListeners();
  }
}
