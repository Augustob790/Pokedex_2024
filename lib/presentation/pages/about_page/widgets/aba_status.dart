import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../domain/models/pokemon_detail_model.dart';
import '../../../stores/pokeapiv2_store.dart';

class AbaStatus extends StatelessWidget {
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();

  AbaStatus({super.key});

  List<int?> getStatusPokemon(PokemonDetailModel? pokeApiV2) {
    List<int?> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    if (pokeApiV2?.stats != null) {
      for (var f in pokeApiV2!.stats!) {
        sum = sum + f.baseStat!;
        switch (f.stat!.name) {
          case 'speed':
            list[0] = f.baseStat;
            break;
          case 'special-defense':
            list[1] = f.baseStat;
            break;
          case 'special-attack':
            list[2] = f.baseStat;
            break;
          case 'defense':
            list[3] = f.baseStat;
            break;
          case 'attack':
            list[4] = f.baseStat;
            break;
          case 'hp':
            list[5] = f.baseStat;
            break;
        }
      }
    }
    list[6] = sum;

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Velocidade',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sp. Def',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sp. Atq',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Defesa',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ataque',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'HP',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Observer(builder: (context) {
                  List<int?> list =
                      getStatusPokemon(_pokeApiV2Store.pokeApiV2);
                  return Column(
                    children: <Widget>[
                      Text(
                        list[0].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        list[1].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        list[2].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        list[3].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        list[4].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        list[5].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        list[6].toString(),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
                const SizedBox(
                  width: 10,
                ),
                Observer(builder: (context) {
                  List<int?> list =
                      getStatusPokemon(_pokeApiV2Store.pokeApiV2);
                  return Column(
                    children: <Widget>[
                      StatusBar(
                        widthFactor: list[0]! / 160,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: list[1]! / 160,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: list[2]! / 160,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: list[3]! / 160,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: list[4]! / 160,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: list[5]! / 160,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: list[6]! / 600,
                      ),
                    ],
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  final double? widthFactor;

  const StatusBar({super.key, this.widthFactor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 4,
          width: MediaQuery.of(context).size.width * .47,
          alignment: Alignment.centerLeft,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey,
          ),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: const StadiumBorder(),
                color: widthFactor! > 0.5 ? Colors.teal : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
