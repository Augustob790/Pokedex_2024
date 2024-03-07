// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:mobx/mobx.dart';

import '../../data/repositories/pokemon_repositories.dart';
import '../../domain/models/pokemon_detail_model.dart';
import '../../domain/models/specie.dart';

part 'pokeapiv2_store.g.dart';

class PokeApiV2Store = _PokeApiV2StoreBase with _$PokeApiV2Store;

abstract class _PokeApiV2StoreBase with Store {
  PokemonRepository pokemonRepository = PokemonRepository();

  @observable
  Specie? specie;

  @observable
  PokemonDetailModel? pokeApiV2;

  @action
  Future<void> getInfoPokemon(String nome) async {
    try {
      final response = await pokemonRepository.getInfoPokemon(nome);
      pokeApiV2 = response;
    } catch (e) {
      log(e.toString());
      throw "Não foi possível carregar os dados!";
    }
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    try {
      final response = await pokemonRepository.getInfoSpecie(numPokemon);
      specie = response;
    } catch (e) {
      log(e.toString());
      throw "Não foi possível carregar os dados!";
    }
  }
}
