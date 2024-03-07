import 'abilitie_model.dart';

class PokemonDetailModel {
  List<AbilitieModel>? abilities;
  int? baseExperience;
  List<GameIndiceModel>? gameIndices;
  List<Null>? heldItems;
  int? height;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<MoveModel>? moves;
  String? name;
  int? order;
  AbilityModel? species;
  List<StatModel>? stats;
  List<TypeModel>? types;
  int? weight;

  PokemonDetailModel({
    this.abilities,
    this.baseExperience,
    this.gameIndices,
    this.heldItems,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.stats,
    this.types,
    this.weight,
  });

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['abilities'] != null) {
      abilities = <AbilitieModel>[];
      json['abilities'].forEach((v) {
        abilities!.add(AbilitieModel.fromJson(v));
      });
    }
    baseExperience = json['base_experience'];
    if (json['game_indices'] != null) {
      gameIndices = <GameIndiceModel>[];
      json['game_indices'].forEach((v) {
        gameIndices!.add(GameIndiceModel.fromJson(v));
      });
    }
    height = json['height'];
    id = json['id'];
    isDefault = json['is_default'];
    locationAreaEncounters = json['location_area_encounters'];
    if (json['moves'] != null) {
      moves = <MoveModel>[];
      json['moves'].forEach((v) {
        moves!.add(MoveModel.fromJson(v));
      });
    }
    name = json['name'];
    order = json['order'];
    species = json['species'] != null
        ? AbilityModel.fromJson(json['species'])
        : null;
    if (json['stats'] != null) {
      stats = <StatModel>[];
      json['stats'].forEach((v) {
        stats!.add(StatModel.fromJson(v));
      });
    }
    if (json['types'] != null) {
      types = <TypeModel>[];
      json['types'].forEach((v) {
        types!.add(TypeModel.fromJson(v));
      });
    }
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    data['base_experience'] = baseExperience;
    if (gameIndices != null) {
      data['game_indices'] = gameIndices!.map((v) => v.toJson()).toList();
    }
    data['height'] = height;
    data['id'] = id;
    data['is_default'] = isDefault;
    data['location_area_encounters'] = locationAreaEncounters;
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['order'] = order;
    if (species != null) {
      data['species'] = species!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    data['weight'] = weight;
    return data;
  }
}

class AbilityModel {
  String? name;
  String? url;

  AbilityModel({this.name, this.url});

  AbilityModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class GameIndiceModel {
  int? gameIndex;
  AbilityModel? version;

  GameIndiceModel({this.gameIndex, this.version});

  GameIndiceModel.fromJson(Map<String, dynamic> json) {
    gameIndex = json['game_index'];
    version = json['version'] != null
        ? AbilityModel.fromJson(json['version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_index'] = gameIndex;
    if (version != null) {
      data['version'] = version!.toJson();
    }
    return data;
  }
}

class MoveModel {
  AbilityModel? move;
  List<VersionGroupDetailModel>? versionGroupDetails;

  MoveModel({this.move, this.versionGroupDetails});

  MoveModel.fromJson(Map<String, dynamic> json) {
    move =
        json['move'] != null ? AbilityModel.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetailModel>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(VersionGroupDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (move != null) {
      data['move'] = move!.toJson();
    }
    if (versionGroupDetails != null) {
      data['version_group_details'] =
          versionGroupDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionGroupDetailModel {
  int? levelLearnedAt;
  AbilityModel? moveLearnMethod;
  AbilityModel? versionGroup;

  VersionGroupDetailModel(
      {this.levelLearnedAt, this.moveLearnMethod, this.versionGroup});

  VersionGroupDetailModel.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? AbilityModel.fromJson(json['move_learn_method'])
        : null;
    versionGroup = json['version_group'] != null
        ? AbilityModel.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level_learned_at'] = levelLearnedAt;
    if (moveLearnMethod != null) {
      data['move_learn_method'] = moveLearnMethod!.toJson();
    }
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }
}

class SpriteModel {
  String? backDefault;
  Null backFemale;
  String? backShiny;
  Null backShinyFemale;
  String? frontDefault;
  Null frontFemale;
  String? frontShiny;
  Null frontShinyFemale;

  SpriteModel(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale});

  SpriteModel.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class StatModel {
  int? baseStat;
  int? effort;
  AbilityModel? stat;

  StatModel({this.baseStat, this.effort, this.stat});

  StatModel.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];
    stat =
        json['stat'] != null ? AbilityModel.fromJson(json['stat']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class TypeModel {
  int? slot;
  AbilityModel? type;

  TypeModel({this.slot, this.type});

  TypeModel.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type =
        json['type'] != null ? AbilityModel.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}
