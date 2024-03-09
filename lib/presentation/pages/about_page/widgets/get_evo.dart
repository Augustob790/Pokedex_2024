import 'package:flutter/material.dart';

import '../../../../domain/models/pokemon_model.dart';
import '../../../stores/pokeapi_store.dart';

class EvoWidget extends StatelessWidget {
  final PokemonModel pokemon;
  final PokeApiStore pokeApiStore;

  const EvoWidget({
    super.key,
    required this.pokemon,
    required this.pokeApiStore,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: getEvolucao(),
    );
  }

  List<Widget> getEvolucao() {
    List<Widget> list = [];
    if (pokemon.prevEvolution != null) {
      for (var f in pokemon.prevEvolution!) {
        list.add(resizePokemon(pokeApiStore.getImage(numero: f.number)));
        list.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              f.name!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        list.add(const Icon(Icons.keyboard_arrow_down));
      }
    }
    list.add(resizePokemon(
        pokeApiStore.getImage(numero: pokeApiStore.pokemonAtual!.num)));
    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          pokeApiStore.pokemonAtual!.name!,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    if (pokemon.nextEvolution != null) {
      list.add(const Icon(Icons.keyboard_arrow_down));
      for (var f in pokemon.nextEvolution!) {
        list.add(resizePokemon(pokeApiStore.getImage(numero: f.number)));
        list.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              f.name!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        if (pokemon.nextEvolution!.last.name != f.name) {
          list.add(const Icon(Icons.keyboard_arrow_down));
        }
      }
    }

    return list;
  }

  Widget resizePokemon(Widget pokemonWidget) {
    return SizedBox(
      width: 100,
      height: 100,
      child: pokemonWidget,
    );
  }
}
