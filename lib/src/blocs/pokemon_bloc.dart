import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/src/blocs/pokemon_event.dart';
import 'package:pokedex_flutter/src/blocs/pokemon_state.dart';

import '../models/pokemon_model.dart';
import '../repository/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  PokemonRepository pokemonRepository = PokemonRepository();
  List<Pokemon> pokemonNameList=[];

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) {});

    on<GetPokemonEvent>((event,emit)async{
      pokemonNameList = (await pokemonRepository.getAllPokemons()).cast<Pokemon>();
      emit(PokemonLoaded(pokemonList: pokemonNameList!));
    });
  }
}