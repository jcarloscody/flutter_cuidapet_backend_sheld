import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'controller_manual.g.dart';

class Controller {
  @Route.get('/menu')
  Future<Response> home(Request request) async {
    return Response.ok('respondendo com MENU');
  }

  Router get rota => _$ControllerRouter(this);
}
