// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cuidapet_api/application/config/bd/database_connection_configuration.dart'
    as _i3;
import 'package:cuidapet_api/application/database/database_connection.dart'
    as _i5;
import 'package:cuidapet_api/application/database/i_database_connection.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.DatabaseConnectionConfiguration>(
    () => _i3.DatabaseConnectionConfiguration(
      host: gh<String>(),
      user: gh<String>(),
      password: gh<String>(),
      databaseName: gh<String>(),
      port: gh<int>(),
    ),
    instanceName: 'ConfiguracaoConexaoBD',
  );
  gh.lazySingleton<_i4.IDatabaseConnection>(() => _i5.DatabaseConnection(
      configuration: gh<_i3.DatabaseConnectionConfiguration>()));
  return getIt;
}
