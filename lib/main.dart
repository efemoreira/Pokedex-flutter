import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/src/blocs/pokemon_bloc.dart';
import 'src/app.dart';

void main(){
  runApp(
    BlocProvider(create: (context) => PokemonBloc(),
      child: const App(),
    )
  );
}