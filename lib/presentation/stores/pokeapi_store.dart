// ignore_for_file: library_private_types_in_public_api
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../constants/api_routes.dart';
import '../../constants/consts_colors.dart';
import '../../data/repositories/pokemon_repositories.dart';
import '../../domain/models/pokemon_model.dart';
import '../../domain/models/pokeon_list_model.dart';

part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  PokemonRepository pokemonRepository = PokemonRepository();

  @observable
  PokeListModel? _pokeAPI;

  @observable
  PokemonModel? _pokemonAtual;

  @observable
  dynamic corPokemon;

  @observable
  dynamic errorMessage;

  @observable
  dynamic isLoading;

  @observable
  int? posicaoAtual;

  @computed
  PokeListModel? get pokeAPI => _pokeAPI;

  @computed
  PokemonModel? get pokemonAtual => _pokemonAtual;

  @action
  void fetchPokemonList() {
    _pokeAPI = null;
    getAllPokemons().then((pokeList) {
      _pokeAPI = pokeList;
    });
  }

  PokemonModel getPokemon({required int index}) {
    return _pokeAPI!.pokemon![index];
  }

  @action
  void setPokemonAtual({required int index}) {
    _pokemonAtual = _pokeAPI?.pokemon?[index];
    corPokemon = ColorsUi.getColorType(type: _pokemonAtual?.type?[0]);
    posicaoAtual = index;
  }

  @action
  Widget getImage({String? numero}) {
    return Image.network('${ApiRoutes.getImage}$numero.png');
  }

  Future<PokeListModel?> getAllPokemons() async {
    isLoading = "isLoading";
    try {
      final response = await pokemonRepository.getAllPokemons();
      isLoading = "sucess";
      return response;
    } catch (e) {
      log(e.toString());
      isLoading = "error";
      errorMessage = e.toString();
      throw "Não foi possível carregar os dados!";
    }
  }
}
