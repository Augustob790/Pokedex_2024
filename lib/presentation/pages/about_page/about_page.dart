// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
//import 'package:md2_tab_indicator/md2_tab_indicator.dart';
import 'package:mobx/mobx.dart';

import '../../stores/pokeapi_store.dart';
import 'widgets/aba_evolucao.dart';
import 'widgets/aba_sobre.dart';
import 'widgets/aba_status.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;
  PokeApiStore? _pokemonStore;
  late ReactionDisposer _disposer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pokemonStore = GetIt.instance<PokeApiStore>();
    _pageController = PageController(initialPage: 0);

    _disposer = reaction(
      (f) => _pokemonStore!.pokemonAtual,
      (dynamic r) => _pageController!.animateToPage(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Observer(builder: (context) {
            return TabBar(
              onTap: (index) {
                _pageController!.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              controller: _tabController,
              labelStyle: const TextStyle(
                  //up to your taste
                  fontWeight: FontWeight.w700),
              indicatorSize: TabBarIndicatorSize.label, //makes it better
              labelColor: _pokemonStore!.corPokemon, //Google's sweet blue
              unselectedLabelColor: const Color(0xff5f6368), //niceish grey
              isScrollable: true, //up to your taste
              // indicator: MD2Indicator(
              //     //it begins here
              //     indicatorHeight: 3,
              //     indicatorColor: _pokemonStore!.corPokemon,
              //     indicatorSize: MD2IndicatorSize
              //         .normal //3 different modes tiny-normal-full
              //     ),
              tabs: const <Widget>[
                Tab(
                  text: "Sobre",
                ),
                Tab(
                  text: "Evolução",
                ),
                Tab(
                  text: "Status",
                ),
              ],
            );
          }),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController!
              .animateTo(index, duration: const Duration(milliseconds: 300));
        },
        controller: _pageController,
        children: <Widget>[
          AbaSobre(),
          AbaEvolucao(),
          AbaStatus(),
        ],
      ),
    );
  }
}