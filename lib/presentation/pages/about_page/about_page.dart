// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../stores/pokeapi_store.dart';
import '../../controller/about_page_controller.dart';
import 'evo/evo.dart';
import 'about/about.dart';
import 'status/status.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>with SingleTickerProviderStateMixin {
  TabController? _tabController;
  PageController? _pageController;
  PokeApiStore? _pokemonStore;
  late ReactionDisposer _disposer;
  AboutPageController controller = AboutPageController();

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
                _pageController!.animateToPage(index,duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
              controller: _tabController,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
              indicatorSize: TabBarIndicatorSize.tab, 
              labelColor: _pokemonStore!.corPokemon, 
              isScrollable: true,
              indicatorColor:  _pokemonStore!.corPokemon,
              tabs: const <Widget>[
                Tab(
                  text: "Sobre",
                ),
                Tab(
                  text: "Cadeia Evolutiva",
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
          _tabController!.animateTo(index, duration: const Duration(milliseconds: 300));
        },
        controller: _pageController,
        children: <Widget>[
          AbaSobre(),
          AbaEvolucao(),
          AbaStatus(controller: controller),
        ],
      ),
    );
  }
}
