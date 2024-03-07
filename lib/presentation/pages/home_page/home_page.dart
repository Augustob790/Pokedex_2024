// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get_it/get_it.dart';
import '../../../constants/consts_app.dart';
import '../../../domain/models/pokemon_model.dart';
import '../../stores/pokeapi_store.dart';
import '../poke_detail/poke_detail_page.dart';
import 'widgets/app_bar_home.dart';
import 'widgets/poke_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeApiStore? _pokemonStore;

  @override
  void initState() {
    super.initState();
    _pokemonStore = GetIt.instance<PokeApiStore>();
    if (_pokemonStore!.pokeAPI == null) {
      _pokemonStore!.fetchPokemonList();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.antiAlias,
        // overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).padding.top - 240 / 2.9,
            left: screenWidth - (240 / 1.6),
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                ColorsUi.blackPokeball,
                height: 240,
                width: 240,
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: <Widget>[
                Container(
                  height: statusWidth,
                ),
                const AppBarHome(),
                Expanded(
                  child: SizedBox(
                    child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        return (_pokemonStore!.pokeAPI != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.all(12),
                                  addAutomaticKeepAlives: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  itemCount:
                                      _pokemonStore!.pokeAPI!.pokemon!.length,
                                  itemBuilder: (context, index) {
                                    PokemonModel pokemon =
                                        _pokemonStore!.getPokemon(index: index);
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: 2,
                                      child: ScaleAnimation(
                                        child: GestureDetector(
                                          child: PokeItem(
                                            types: pokemon.type,
                                            index: index,
                                            name: pokemon.name,
                                            num: pokemon.num,
                                          ),
                                          onTap: () {
                                            _pokemonStore!
                                                .setPokemonAtual(index: index);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PokeDetailPage(
                                                  index: index,
                                                ),
                                                fullscreenDialog: true,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
