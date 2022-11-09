import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.config.dart';

// void configureDependencies() {
//   //para evitar este árduo trabalho foi inventado o injectable
//   final getIt = GetIt.I;

//   getIt.registerFactory(() => RandomFactoryModel());
//   getIt.registerSingleton(RandomSingletonModel());
//   getIt.registerLazySingleton(
//       () => RandomLazySingletonModel()); //inicialização preguiçosa
// }

final getIt2 = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false)
void configureDependencies2() => $initGetIt(
    getIt2); // deve rodar o ->> flutter pub run build_runner watch ou flutter pub run build_runner watch --delete-conflicting-outputs

