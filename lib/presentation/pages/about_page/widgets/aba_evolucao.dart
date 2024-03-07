import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';


import '../../../../domain/models/pokemon_model.dart';
import '../../../stores/pokeapi_store.dart';

class AbaEvolucao extends StatelessWidget {
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  AbaEvolucao({super.key});

  Widget resizePokemon(Widget widget) {
    return SizedBox(height: 80, width: 80, child: widget);
  }

  List<Widget> getEvolucao(PokemonModel pokemon) {
    List<Widget> list = [];
    if (pokemon.prevEvolution != null) {
      for (var f in pokemon.prevEvolution!) {
        list.add(resizePokemon(_pokeApiStore.getImage(numero: f.number)));
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
        _pokeApiStore.getImage(numero: _pokeApiStore.pokemonAtual!.num)));
    list.add(
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Text(
          _pokeApiStore.pokemonAtual!.name!,
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
        list.add(resizePokemon(_pokeApiStore.getImage(numero: f.number)));
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          PokemonModel pokemon = _pokeApiStore.pokemonAtual!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: getEvolucao(pokemon),
            ),
          );
        }),
      ),
    );
  }
}
