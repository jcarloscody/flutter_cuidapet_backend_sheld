import 'package:cuidapet_api/application/config/bd/database_connection_configuration.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/application/logger/i_logger_impl.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../routes/manual/controller_manual.dart';
import '../routes/router_configure.dart';
import 'injectables/service_locator_config.dart';

var env = DotEnv(includePlatformEnvironment: true)..load();

class ApplicationConfig {
  static void loadConfigApplication({required Router rota}) {
    // print(env['url_banco_de_dados']);
    //print(env['JAVA_HOME']);

    injetandoDependenciasManualmente(env);

    //pegando todas as dependencias da aplicacao de forma arquitetural
    configureDependencies();

    configurandoRotasManualmente(rota);

    //passando todas as rotas criadas nos modulos de forma arquitetural
    final rotasConfig = RouterConfigure(rota);
    rotasConfig.config();
  }

  static void injetandoDependenciasManualmente(DotEnv env) {
    final databaseConfig = DatabaseConnectionConfiguration(
      host: env['databaseHost'] as String,
      user: env['databaseUser'] as String,
      password: env['databasePassword'] as String,
      databaseName: env['databaseName'] as String,
      port: int.tryParse(env['databasePort']!) ?? 0,
    );

    //injetando dependencia manualmente
    GetIt.I.registerSingleton(databaseConfig);
    GetIt.I.registerLazySingleton<ILogger>(() => ILoggerImpl());
  }

  static void configurandoRotasManualmente(Router rota) {
    //apenas uns exemplos manuais
    rota.get('/menu', menu);
    final controller = Controller();
    rota.mount('/controller/', controller.rota);
  }

  //apenas um exemplo
  static Response menu(Request request) {
    return Response.ok("MENU");
  }
}
