import 'package:dotenv/dotenv.dart';

class ApplicationConfig {
  Future<void> loadConfigApplication() async {
    await _loadEnv();
    var env = DotEnv(includePlatformEnvironment: true)..load();
    print(env['url_banco_de_dados']);
  }

  Future<void> _loadEnv() async =>
      DotEnv(includePlatformEnvironment: true)..load();
}
