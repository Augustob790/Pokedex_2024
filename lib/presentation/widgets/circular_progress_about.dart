import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../stores/pokeapi_store.dart';

class CircularProgressAbout extends StatelessWidget {
  const CircularProgressAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: SizedBox(
            height: 15,
            width: 15,
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color?>(
                    GetIt.instance<PokeApiStore>().corPokemon))),
      ),
    );
  }
}
