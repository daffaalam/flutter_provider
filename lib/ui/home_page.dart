import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';
import '../provider/theme_provider.dart';
import 'detail_page.dart';
import 'home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<PopupMenuEntry<ThemeMode>> _menu(BuildContext context) {
    return List<PopupMenuEntry<ThemeMode>>.generate(
      ThemeMode.values.length,
      (int index) {
        return PopupMenuItem<ThemeMode>(
          value: ThemeMode.values[index],
          child: Text('${ThemeMode.values[index]}'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO 3 : Consume Provider, Use Data, Show/View
        title: Consumer<CountProvider>(
          builder: (
            BuildContext context,
            CountProvider count,
            Widget? child,
          ) {
            return Text('Count : ${count.number}');
          },
        ),
        actions: <Widget>[
          PopupMenuButton<ThemeMode>(
            itemBuilder: _menu,
            initialValue: context.watch<ThemeProvider>().mode,
            onSelected: (ThemeMode mode) {
              // TODO 8 : Consume Provider, Set Data
              context.read<ThemeProvider>().change(mode);
            },
          ),
        ],
      ),
      body: const HomeContent(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const DetailPage(),
          ),
        ),
      ),
    );
  }
}
