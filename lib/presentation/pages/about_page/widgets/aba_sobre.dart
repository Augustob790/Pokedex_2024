import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../widgets/circular_progress_about.dart';
import '../../../../domain/models/specie.dart';
import '../../../stores/pokeapi_store.dart';
import '../../../stores/pokeapiv2_store.dart';

class AbaSobre extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  AbaSobre({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Descrição',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (context) {
              Specie? specie = _pokeApiV2Store.specie;
              return SizedBox(
                  height: 70,
                  child: SingleChildScrollView(
                      child: specie != null
                          ? Text(
                              specie.flavorTextEntries!
                                  .where((item) => item.language!.name == 'en')
                                  .first
                                  .flavorText!,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            )
                          : const CircularProgressAbout()));
            }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Biologia',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Observer(builder: (context) {
                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Altura',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          _pokeApiStore.pokemonAtual!.height!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Peso',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          _pokeApiStore.pokemonAtual!.weight!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
