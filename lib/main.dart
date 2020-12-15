import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'provider/count_provider.dart';
import 'provider/theme_provider.dart';
import 'ui/home_page.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<CountProvider>(
          create: (BuildContext context) => CountProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(),
        ),
      ],
      builder: (
        BuildContext context,
        Widget child,
      ) {
        return MaterialApp(
          home: HomePage(),
          darkTheme: ThemeData.dark(),
          themeMode: context.watch<ThemeProvider>().mode,
        );
      },
    );
  }
}
