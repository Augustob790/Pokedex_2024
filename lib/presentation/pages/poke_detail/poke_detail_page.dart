// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

import '../../../constants/consts_app.dart';
import '../../../domain/models/pokemon_model.dart';
import '../../stores/pokeapi_store.dart';
import '../../stores/pokeapiv2_store.dart';
import '../about_page/about_page.dart';

class PokeDetailPage extends StatefulWidget {
  final int? index;
  const PokeDetailPage({super.key, this.index});

  @override
  _PokeDetailPageState createState() => _PokeDetailPageState();
}

class _PokeDetailPageState extends State<PokeDetailPage> {
  PageController? _pageController;
  PokeApiStore? _pokemonStore;
  PokeApiV2Store? _pokeApiV2Store;
  // MultiTrackTween _animation;
  late double _progress;
  double? _multiple;
  double? _opacity;
  double? _opacityTitleAppBar;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.index!, viewportFraction: 0.5);
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pokeApiV2Store = GetIt.instance<PokeApiV2Store>();
    _pokeApiV2Store!.getInfoPokemon(_pokemonStore!.pokemonAtual!.name);
    _pokeApiV2Store!.getInfoSpecie(_pokemonStore!.pokemonAtual!.id.toString());
    // _animation = MultiTrackTween([
    //   Track("rotation").add(Duration(seconds: 5), Tween(begin: 0.0, end: 6.0),
    //       curve: Curves.linear)
    // ]);
    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitleAppBar = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Observer(
            builder: (context) {
              return AnimatedContainer(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      _pokemonStore!.corPokemon.withOpacity(0.7),
                      _pokemonStore!.corPokemon,
                    ],
                  ),
                ),
                duration: const Duration(milliseconds: 300),
                child: Stack(
                  children: <Widget>[
                    AppBar(
                      centerTitle: true,
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      actions: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 200),
                              opacity: _opacityTitleAppBar! >= 0.2 ? 0.2 : 0.0,
                              child: Image.asset(
                                ColorsUi.whitePokeball,
                                height: 50,
                                width: 50,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.12 -
                          _progress *
                              (MediaQuery.of(context).size.height * 0.060),
                      left: 20 +
                          _progress *
                              (MediaQuery.of(context).size.height * 0.060),
                      child: Text(
                        _pokemonStore!.pokemonAtual!.name!,
                        style: TextStyle(
                            fontFamily: 'Google',
                            fontSize: 38 -
                                _progress *
                                    (MediaQuery.of(context).size.height *
                                        0.011),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.16,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              setTipos(_pokemonStore!.pokemonAtual!.type!),
                              Text(
                                '#${_pokemonStore!.pokemonAtual!.num}',
                                style: const TextStyle(
                                    fontFamily: 'Google',
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SlidingSheet(
            listener: (state) {
              setState(
                () {
                  _progress = state.progress;
                  _multiple = 1 - interval(0.60, 0.87, _progress);
                  _opacity = _multiple;
                  _opacityTitleAppBar = interval(0.60, 0.87, _progress);
                },
              );
            },
            elevation: 0,
            cornerRadius: 30,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.60, 0.87],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).size.height * 0.12,
                child: const AboutPage(),
              );
            },
          ),
          Opacity(
            opacity: _opacity!,
            child: Padding(
              padding: EdgeInsets.only(
                  top: _opacityTitleAppBar == 1
                      ? 1000
                      : (MediaQuery.of(context).size.height * 0.25) -
                          _progress * 50),
              child: SizedBox(
                height: 200,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    _pokemonStore!.setPokemonAtual(index: index);
                    _pokeApiV2Store!
                        .getInfoPokemon(_pokemonStore!.pokemonAtual!.name);
                    _pokeApiV2Store!.getInfoSpecie(
                        _pokemonStore!.pokemonAtual!.id.toString());
                  },
                  itemCount: _pokemonStore!.pokeAPI!.pokemon!.length,
                  itemBuilder: (BuildContext context, int index) {
                    PokemonModel pokeitem =
                        _pokemonStore!.getPokemon(index: index);
                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Image.asset(
                          ColorsUi.whitePokeball,
                          height: 270,
                          width: 270,
                        ),
                        IgnorePointer(
                          child: Observer(
                              name: 'Pokemon',
                              builder: (context) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    AnimatedPadding(
                                      duration: const Duration(milliseconds: 400),
                                      curve: Curves.easeIn,
                                      padding: EdgeInsets.only(
                                          top: index ==
                                                  _pokemonStore!.posicaoAtual
                                              ? 0
                                              : 60,
                                          bottom: index ==
                                                  _pokemonStore!.posicaoAtual
                                              ? 0
                                              : 60),
                                      child: Hero(
                                        tag:
                                            index == _pokemonStore!.posicaoAtual
                                                ? pokeitem.name!
                                                : 'none$index',
                                        child: Image.network(
                                          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${pokeitem.num}.png',
                                          height: 160,
                                          width: 160,
                                          color: index ==
                                                  _pokemonStore!.posicaoAtual
                                              ? null
                                              : Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget setTipos(List<String> types) {
    List<Widget> lista = [];
    for (var nome in types) {
      lista.add(
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: const TextStyle(
                      fontFamily: 'Google',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            )
          ],
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lista,
    );
  }
}
