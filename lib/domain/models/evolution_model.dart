class EvolutionModel {
  String? number;
  String? name;

  EvolutionModel({this.number, this.name});

  EvolutionModel.fromJson(Map<String, dynamic> json) {
    number = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['num'] = number;
    data['name'] = name;
    return data;
  }
}
