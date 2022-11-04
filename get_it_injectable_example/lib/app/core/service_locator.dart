import 'package:get_it/get_it.dart';
import 'package:get_it_injectable_example/app/models/random_factory_model.dart';
import 'package:get_it_injectable_example/app/models/random_lazy_singleton_model.dart';
import 'package:get_it_injectable_example/app/models/random_singleton_model.dart';
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

final get_It = GetIt.instance;

@InjectableInit(
    initializerName: r'$initGetIt',
    preferRelativeImports: true,
    asExtension: false)
void configureDependencies2() =>
    $initGetIt(get_It); // deve rodar o ->> flutter pub run build_runner watch

