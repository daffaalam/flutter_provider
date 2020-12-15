import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';
import '../provider/theme_provider.dart';

class DetailPage extends StatelessWidget {
  List<Widget> _children(ThemeProvider theme, CountProvider count) {
    return <Widget>[
      Expanded(
        child: Center(
          child: Text(
            '${count.number}',
            style: TextStyle(
              fontSize: kToolbarHeight,
            ),
          ),
        ),
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed: () => count.decrement(),
              child: Text('REMOVE'),
            ),
          ),
          Container(
            width: 8.0,
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () => count.increment(),
              child: Text('ADD'),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed: () => theme.change(ThemeMode.light),
              child: Text('LIGHT'),
            ),
          ),
          Container(
            width: 8.0,
          ),
          Expanded(
            child: RaisedButton(
              onPressed: () => theme.change(ThemeMode.dark),
              child: Text('DARK'),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Consumer2<ThemeProvider, CountProvider>(
        builder: (
          BuildContext context,
          ThemeProvider theme,
          CountProvider count,
          Widget child,
        ) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: _children(theme, count),
            ),
          );
        },
      ),
    );
  }
}
