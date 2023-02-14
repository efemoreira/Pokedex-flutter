import '../models/pokemon_model.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonEmpty extends PokemonState {}

class PokemonLoaded extends PokemonState{
  List<Pokemon> pokemonList=[];

  PokemonLoaded({required this.pokemonList});
}
