import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/pages/about_page/widgets/get_evo.dart';


import '../../../../domain/models/pokemon_model.dart';
import '../../../stores/pokeapi_store.dart';

class AbaEvolucao extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();
  AbaEvolucao({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          PokemonModel pokemon = _pokeApiStore.pokemonAtual!;
          return SingleChildScrollView(
            child: EvoWidget(pokemon: pokemon, pokeApiStore: _pokeApiStore)
          );
        }),
      ),
    );
  }
}
