import '../../domain/models/pokemon_detail_model.dart';

class AboutPageController {

  List<int?> getStatusPokemon(PokemonDetailModel? pokeApiV2) {
    List<int?> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    if (pokeApiV2?.stats != null) {
      for (var f in pokeApiV2!.stats!) {
        sum = sum + f.baseStat!;
        switch (f.stat!.name) {
          case 'speed':
            list[0] = f.baseStat;
            break;
          case 'special-defense':
            list[1] = f.baseStat;
            break;
          case 'special-attack':
            list[2] = f.baseStat;
            break;
          case 'defense':
            list[3] = f.baseStat;
            break;
          case 'attack':
            list[4] = f.baseStat;
            break;
          case 'hp':
            list[5] = f.baseStat;
            break;
        }
      }
    }
    list[6] = sum;

    return list;
  }
}
