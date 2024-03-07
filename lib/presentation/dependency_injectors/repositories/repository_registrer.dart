import 'package:get_it/get_it.dart';
import '../../../data/repositories/pokemon_repositories.dart';
import '../get_it.dart';

class RepositoryRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokemonRepository>()) {
      getIt.registerSingleton<PokemonRepository>(PokemonRepository());
    }
  }
}
