import 'evolution_model.dart';

class PokemonModel {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  String? egg;
  List<EvolutionModel>? nextEvolution;
  List<EvolutionModel>? prevEvolution;

  PokemonModel(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.nextEvolution,
      this.prevEvolution});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    egg = json['egg'];
    if (json['next_evolution'] != null) {
      nextEvolution = <EvolutionModel>[];
      json['next_evolution'].forEach((v) {
        nextEvolution!.add(EvolutionModel.fromJson(v));
      });
    }
    if (json['prev_evolution'] != null) {
      prevEvolution = <EvolutionModel>[];
      json['prev_evolution'].forEach((v) {
        prevEvolution!.add(EvolutionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['num'] = num;
    data['name'] = name;
    data['img'] = img;
    data['type'] = type;
    data['height'] = height;
    data['weight'] = weight;
    data['candy'] = candy;
    data['egg'] = egg;
    if (nextEvolution != null) {
      data['next_evolution'] =
          nextEvolution!.map((v) => v.toJson()).toList();
    }
    if (prevEvolution != null) {
      data['prev_evolution'] =
          prevEvolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
