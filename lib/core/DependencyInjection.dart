import 'package:get_it/get_it.dart';
import 'package:internet_handler/logic/internet/internet_cubit.dart';

import '../presentation/Bloc_Apis/repo/item_repo.dart';

GetIt getIt = GetIt.instance;

class DependencyInjection {
  void serviceLocator() {
    getIt.registerLazySingleton(
      () => ItemRepo(),
    );
    getIt.registerLazySingleton(
        () => InternetCubit(enableInitialConnectionCheck: false));
  }
}
