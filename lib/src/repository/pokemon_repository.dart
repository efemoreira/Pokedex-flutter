import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';

class PokemonRepository {
  Future<List<Pokemon>> getAllPokemons() async {
    final url = 'https://pokeapi.co/api/v2/pokemon?limit=151';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load pokemons');
    }

    final pokemonsData = (json.decode(response.body)['results'] as List)
        .map((pokemon) => _getPokemonData(pokemon['url']));

    final pokemons = await Future.wait(pokemonsData)
        .then((results) => results.map((data) => Pokemon.fromJson(data)).toList());

    return pokemons;
  }

  Future<Map<String, dynamic>> _getPokemonData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Failed to load pokemons');
    }
    return json.decode(response.body);
  }
}