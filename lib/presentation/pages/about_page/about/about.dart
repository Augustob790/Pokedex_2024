import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/presentation/widgets/custom_text.dart';
import '../../../../domain/models/specie.dart';
import '../../../stores/pokeapi_store.dart';
import '../../../stores/pokeapiv2_store.dart';
import '../../../widgets/circular_progress_about.dart';

class AbaSobre extends StatelessWidget {
  AbaSobre({super.key});


  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
  final PokeApiStore _pokeApiStore = GetIt.instance<PokeApiStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                  style: const TextStyle(fontSize: 14))
                              : const CircularProgressAbout()));
                }),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                    text: "Biologia",
                    fontSize: 16,
                    colors: _pokeApiStore.corPokemon,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child:  Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Altura",
                              fontSize: 14,
                              colors: Colors.black54,
                            ),
                            CustomText(
                              text: _pokeApiStore.pokemonAtual!.height!,
                              fontSize: 14,
                              colors: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Peso",
                              fontSize: 14,
                              colors: Colors.black54,
                            ),
                            CustomText(
                              text: _pokeApiStore.pokemonAtual!.weight!,
                              fontSize: 14,
                              colors: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Tipo",
                              fontSize: 14,
                              colors: Colors.black54,
                            ),
                            CustomText(
                              text:_pokeApiV2Store.pokeApiV2?.types!.map((e) => e.type!.name).join(', ') ?? "",
                              fontSize: 14,
                              colors: Colors.black,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                ),
                CustomText(
                  text: "Habilidades",
                  fontSize: 16,
                  colors: _pokeApiStore.corPokemon,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                          text: "Habilidades",
                          fontSize: 14,
                          colors: Colors.black54,
                        ),
                    CustomText(
                      text: _pokeApiV2Store.pokeApiV2?.abilities!.map((e) => e.ability!.name).join(', ') ?? "",
                      fontSize: 14,
                      colors: Colors.black,
                    ),
                  ],
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
