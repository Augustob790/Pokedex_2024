import 'pokemon_detail_model.dart';

class AbilitieModel {
  AbilityModel? ability;
  bool? isHidden;
  int? slot;

  AbilitieModel({this.ability, this.isHidden, this.slot});

  AbilitieModel.fromJson(Map<String, dynamic> json) {
    ability = json['ability'] != null
        ? AbilityModel.fromJson(json['ability'])
        : null;
    isHidden = json['is_hidden'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ability != null) {
      data['ability'] = ability!.toJson();
    }
    data['is_hidden'] = isHidden;
    data['slot'] = slot;
    return data;
  }
}
