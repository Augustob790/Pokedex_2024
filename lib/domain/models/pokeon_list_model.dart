import 'package:flutter_application_1/domain/models/pokemon_model.dart';

class PokeListModel {
  List<PokemonModel>? pokemon;

  PokeListModel({this.pokemon});

  PokeListModel.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = <PokemonModel>[];
      json['pokemon'].forEach((v) {
        pokemon!.add(PokemonModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pokemon != null) {
      data['pokemon'] = pokemon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
