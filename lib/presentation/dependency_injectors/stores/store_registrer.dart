import 'package:get_it/get_it.dart';
import '../../stores/pokeapi_store.dart';
import '../../stores/pokeapiv2_store.dart';
import '../get_it.dart';


class StoreRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<PokeApiStore>()) {
        getIt.registerSingleton<PokeApiStore>(PokeApiStore());
    }

    if (!GetIt.I.isRegistered<PokeApiV2Store>()) {
          getIt.registerSingleton<PokeApiV2Store>(PokeApiV2Store());
    }
  }
}
