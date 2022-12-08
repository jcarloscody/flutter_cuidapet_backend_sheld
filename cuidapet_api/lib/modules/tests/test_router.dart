import 'package:cuidapet_api/application/routes/i_routes.dart';
import 'package:cuidapet_api/modules/tests/test_controller.dart';
import 'package:shelf_router/src/router.dart';

class TestRouter implements IRouter {
  @override
  void configure(Router router) {
    router.mount('/test/', TestController().router);
  }
}
