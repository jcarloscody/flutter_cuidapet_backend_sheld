import 'dart:async';
import 'dart:convert';
import 'package:cuidapet_api/application/exceptions/database_exception.dart';
import 'package:cuidapet_api/application/exceptions/user_exists_exceptions.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/modules/user/view_models/user_save_input_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../service/i_user_service.dart';

part 'auth_controller.g.dart';

@Injectable() //vai criar uma instância nova cada vez que pedir
class AuthController {
  IUserService userService;
  ILogger log;
  AuthController({
    required this.userService,
    required this.log,
  });
  @Route.post('/register') // /auth/register
  Future<Response> saveUser(Request request) async {
    try {
      final userModel = UserSaveInputModel(await request.readAsString());
      await userService.createUser(userModel);

      return Response.ok(jsonEncode({'message': 'cadastro sucesso!'}));
    } on UserExistsExceptions {
      log.error('Erro ao cadastrar - repetido email');
      return Response(400,
          body: jsonEncode({'message': 'Usuário já cadastrado!'}));
    } catch (e) {
      log.error('Erro ao cadastrar');

      return Response.internalServerError();
    }
  }

  Router get router => _$AuthControllerRouter(this);
}
