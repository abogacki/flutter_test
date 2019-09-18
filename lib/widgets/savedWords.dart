import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/main.dart';
import 'package:provider/provider.dart';

class SavedWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedWordPairModel>(
        builder: (context, saveWordPairModel, widget) {
      //
      final Iterable<ListTile> tiles =
          saveWordPairModel.savedWordPair.map((pair) {
        return ListTile(title: Text(pair.asPascalCase));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(title: Text('Quiz App - Saved Suggestions')),
        body: ListView(children: divided),
      );
    });
  }
}

// Navigator.of(context)
//         .push(MaterialPageRoute<void>(builder: (BuildContext context) {
//       final Iterable<ListTile> tiles = _saved.map((pair) {
//         return ListTile(title: Text(pair.asPascalCase));
//       });

//       final List<Widget> divided =
//           ListTile.divideTiles(context: context, tiles: tiles).toList();

//       return Scaffold(
//           appBar: AppBar(title: Text('Saved Suggetsions')),
//           body: ListView(children: divided));
//     }));
