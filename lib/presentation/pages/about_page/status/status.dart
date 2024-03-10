import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../../../stores/pokeapiv2_store.dart';
import '../../../controller/about_page_controller.dart';
import '../../../widgets/status_bar.dart';

class AbaStatus extends StatefulWidget {
  const AbaStatus({super.key, required this.controller});

  final AboutPageController controller;

  @override
  State<AbaStatus> createState() => _AbaStatusState();
}

class _AbaStatusState extends State<AbaStatus> {
  final PokeApiV2Store _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child:  SingleChildScrollView(
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
                  List<int?> list = widget.controller.getStatusPokemon(_pokeApiV2Store.pokeApiV2);
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
                  List<int?> list = widget.controller.getStatusPokemon(_pokeApiV2Store.pokeApiV2);
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
      ),)
    );
  }
}


