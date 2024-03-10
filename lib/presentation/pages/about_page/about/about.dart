import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../../domain/models/specie.dart';
import '../../../stores/pokeapi_store.dart';
import '../../../stores/pokeapiv2_store.dart';
import '../../../widgets/circular_progress_about.dart';
import '../../../widgets/custom_column.dart';

class AbaSobre extends StatelessWidget {
  AbaSobre({super.key});

  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(builder: (context) {
                Specie? specie = _pokeApiV2Store.specie;
                return SizedBox(
                    height: 70,
                    child: specie != null
                        ? Text(
                            specie.flavorTextEntries?.where((item) => item.language!.name == 'en').first.flavorText?.replaceAll('\n', '') ?? "",
                            textAlign: TextAlign.justify,
                            style: const TextStyle(fontSize: 14),
                          )
                        : const CircularProgressAbout());
              }),
              CustomColumnWidget(
                bio: true,
                colors: _pokeApiStore.corPokemon,
                title: "Biologia",
                title1: "Altura",
                text1: _pokeApiStore.pokemonAtual?.height ?? "",
                title2: "Peso",
                text2: _pokeApiStore.pokemonAtual?.weight ?? "",
                title3: "Tipo",
                text3: _pokeApiV2Store.pokeApiV2?.types?.map((e) => e.type?.name).join(', ') ?? "",
              ),
              CustomColumnWidget(
                  bio: false,
                  colors: _pokeApiStore.corPokemon,
                  title: "Habitat",
                  title1: "Local",
                  text1: _pokeApiV2Store.specie?.habitat?.name ?? "",
              ),
              CustomColumnWidget(
                  bio: false,
                  colors: _pokeApiStore.corPokemon,
                  title: "Habilidades",
                  title1: "Habilidades",
                  text1: _pokeApiV2Store.pokeApiV2?.abilities?.map((e) => e.ability?.name).join(', ') ?? "",
              ),
            ],
          );
        }),
      ),
    );
  }
}
