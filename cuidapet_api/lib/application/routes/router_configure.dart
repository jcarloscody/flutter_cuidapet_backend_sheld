import 'package:cuidapet_api/application/routes/i_routes.dart';
import 'package:cuidapet_api/modules/tests/test_router.dart';
import 'package:shelf_router/shelf_router.dart';

class RouterConfigure {
  final Router _rota;
  final List<IRouter> _rotas = [
    TestRouter(),
  ];

  RouterConfigure(this._rota);

  // ignore: avoid_function_literals_in_foreach_calls
  void config() => _rotas.forEach((rota) {
        rota.configure(_rota);
      });
}
