import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';
import '../provider/theme_provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  Widget _button({
    required String title,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }

  List<Widget> _children(ThemeProvider theme, CountProvider count) {
    return <Widget>[
      Expanded(
        child: Center(
          child: Text(
            '${count.number}',
            style: const TextStyle(
              fontSize: kToolbarHeight,
            ),
          ),
        ),
      ),
      Row(
        children: <Widget>[
          _button(
            title: 'INCREMENT',
            onPressed: () => count.decrement(),
          ),
          _button(
            title: 'DECREMENT',
            onPressed: () => count.increment(),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          _button(
            title: 'SYSTEM',
            onPressed: () => theme.change(ThemeMode.system),
          ),
          _button(
            title: 'LIGHT',
            onPressed: () => theme.change(ThemeMode.light),
          ),
          _button(
            title: 'DARK',
            onPressed: () => theme.change(ThemeMode.dark),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      // TODO 9 : Consume Multi Provider
      body: Consumer2<ThemeProvider, CountProvider>(
        builder: (
          BuildContext context,
          ThemeProvider theme,
          CountProvider count,
          Widget? child,
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
