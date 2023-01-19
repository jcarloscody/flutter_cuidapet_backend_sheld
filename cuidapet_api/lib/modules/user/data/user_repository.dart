import 'package:cuidapet_api/application/database/i_database_connection.dart';
import 'package:cuidapet_api/application/exceptions/database_exception.dart';
import 'package:cuidapet_api/application/exceptions/user_exists_exceptions.dart';
import 'package:cuidapet_api/application/helpers/cripty_helper.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/entities/user.dart';
import 'package:cuidapet_api/modules/user/data/i_user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IDatabaseConnection connection;
  final ILogger iLogger;

  UserRepository(this.connection, this.iLogger);
  @override
  Future<User> createUser(User user) async {
    MySqlConnection? conn;
    try {
      conn = await connection.openConnection();
      final query = '''
insert usuario (email, tipo_cadastro,img_avatar, senha, fornecedor_id, social_id)
values (?,?,?,?,?,?)
''';
      final result = await conn.query(query, [
        user.email,
        user.registerType,
        CriptyHelper.generateSha256Hash(user.password ?? ''),
        user.supplierId,
        user.socialKey,
      ]);

      final userId = result.insertId;
      return user.copyWith(id: userId, password: '');
    } on MySqlException catch (e, s) {
      if (e.message.contains('usuario.email_UNIQUE')) {
        iLogger.error('Usuário já cadastrado', e, s);
        throw UserExistsExceptions();
      }
      iLogger.error('Erro ao criar o usuário', e, s);
      throw DatabaseException(message: 'Erro ao criar usuario');
    } finally {
      await conn?.close();
    }
  }
}
