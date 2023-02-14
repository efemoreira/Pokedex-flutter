import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_flutter/src/blocs/pokemon_event.dart';
import 'package:pokedex_flutter/src/ui/pokemon_detail.dart';

import '../blocs/pokemon_bloc.dart';
import '../blocs/pokemon_state.dart';

import "../utils/cap_string.dart";
import '../utils/type_color.dart';

class PokemonsListScreen extends StatefulWidget {
  const PokemonsListScreen({super.key});

  @override
  State<PokemonsListScreen> createState() => _PokemonsListScreen();
}

class _PokemonsListScreen extends State<PokemonsListScreen> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context).add(GetPokemonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PokemonLoaded) {
            return GridView.builder(
              itemCount: state.pokemonList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                  {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PokemonDetailScreen(
                            pokemon: state.pokemonList[index],
                          ),
                    ),
                  ),},
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: NetworkImage(state.pokemonList[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          state.pokemonList[index].name.capitalize(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                          textAlign: TextAlign.center,
                        ),
                    Wrap(
                      children: state.pokemonList[index].types.map((type) {
                        return Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: getColorByType(type),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            type.capitalize(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}

