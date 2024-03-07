import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants/api_routes.dart';
import '../../domain/models/pokemon_detail_model.dart';
import '../../domain/models/pokeon_list_model.dart';
import '../../domain/models/specie.dart';

class PokemonRepository {
  Dio dio = Dio();

  Future<PokeListModel?> getAllPokemons() async {
    try {
      final response = await dio.get(ApiRoutes.pokeapiURL);
      var decodeJson = jsonDecode(response.data);
      return PokeListModel.fromJson(decodeJson);
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (error.type == DioExceptionType.connectionError) {
        throw "Não foi possivel conectar-se ao servidor, por favor verifique sua conexão!: $error";
      } else {
        log(error.toString());
        throw "Não foi possível carregar os dados!";
      }
    } catch (e) {
      log(e.toString());
      throw "Não foi possível carregar os dados!";
    }
  }

  Future<PokemonDetailModel> getInfoPokemon(String nome) async {
    String url = "${ApiRoutes.pokeapiv2URL}${nome.toLowerCase()}";
    try {
      final response = await dio.get(url);
      return PokemonDetailModel.fromJson(response.data);
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (error.type == DioExceptionType.connectionError) {
        throw "Não foi possivel conectar-se ao servidor, por favor verifique sua conexão!: $error";
      } else {
        log(error.toString());
        throw "Não foi possível carregar os dados!";
      }
    } catch (e) {
      log(e.toString());
      throw "Não foi possível carregar os dados!";
    }
  }

    Future<Specie> getInfoSpecie(String numPokemon) async {
    String url = "${ApiRoutes.pokeapiv2EspeciesURL}$numPokemon";
    try {
      final response = await dio.get(url);
      return Specie.fromJson(response.data);
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout || error.type == DioExceptionType.receiveTimeout) {
        throw "Por favor, verifique sua conexão e tente novamente.";
      } else if (error.type == DioExceptionType.connectionError) {
        throw "Não foi possivel conectar-se ao servidor, por favor verifique sua conexão!: $error";
      } else {
        log(error.toString());
        throw "Não foi possível carregar os dados!";
      }
    } catch (e) {
      log(e.toString());
      throw "Não foi possível carregar os dados!";
    }
  }
}
