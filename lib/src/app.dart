import 'package:flutter/material.dart';
import 'ui/pokemon_list.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: const Scaffold(
          body: PokemonsListScreen(),
        ),
      );
  }
}