import 'package:cuidapet_api/application/config/database_connection_configuration.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/application/logger/i_logger_impl.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';

class ApplicationConfig {
  static void loadConfigApplication() {
    var env = DotEnv(includePlatformEnvironment: true)..load();
    // print(env['url_banco_de_dados']);
    //print(env['JAVA_HOME']);

    final databaseConfig = DatabaseConnectionConfiguration(
      host: env['databaseHost'] as String,
      user: env['databaseUser'] as String,
      password: env['databasePassword'] as String,
      databaseName: env['databaseName'] as String,
      port: int.tryParse(env['databasePort']!) ?? 0,
    );

    GetIt.I.registerSingleton(databaseConfig);

    GetIt.I.registerLazySingleton<ILogger>(() => ILoggerImpl());
  }
}
