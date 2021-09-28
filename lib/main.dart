import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'provider/count_provider.dart';
import 'provider/theme_provider.dart';
import 'ui/home_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Using Multi Provider for mutli logical
      providers: <SingleChildWidget>[
        // TODO 2 : Declare Provider, Create/Initialize
        ChangeNotifierProvider<CountProvider>(
          create: (BuildContext context) => CountProvider(),
        ),
        // TODO 6 : Declare Provider, Create/Initialize
        ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(),
        ),
      ],
      builder: (
        BuildContext context,
        Widget? child,
      ) {
        return MaterialApp(
          home: const HomePage(),
          darkTheme: ThemeData.dark(),
          // TODO 7 : Consume Provider, Watch Data
          themeMode: context.watch<ThemeProvider>().mode,
        );
      },
    );
  }
}
