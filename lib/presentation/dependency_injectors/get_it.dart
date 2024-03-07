

import 'repositories/repository_registrer.dart';
import 'stores/store_registrer.dart';

abstract class IGetItRegister {
  void register();
}

class GetItRegister {
  static register() {
    RepositoryRegister().register();
    StoreRegister().register();
  }
}
