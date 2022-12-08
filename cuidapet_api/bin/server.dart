import 'dart:io';

import 'package:cuidapet_api/application/config/application_config.dart';
import 'package:cuidapet_api/application/controller.dart';
import 'package:cuidapet_api/application/routes/router_configure.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final rota = Router();

//apenas um exemplo
Response menu(Request request) {
  return Response.ok("MENU");
}

void main(List<String> args) async {
  //carregar as configurações do aplicativo
  ApplicationConfig.loadConfigApplication(rota: rota);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler =
      Pipeline().addMiddleware(logRequests()).addMiddleware((innerHandler) {
    print('Middleware 1 Executando');
    return ((request) async {
      print('Middleware 1 interno executado antes da requisição');
      //return Response.ok('Nao passa ningue');
      final resp =
          await innerHandler(request); //passa para o proximo middleware
      print('Middleware 1 interno executado após da requisição');
      return resp;
    });
  }).addMiddleware((innerHandler) {
    print('Middleware 2 Executando');
    return ((request) async {
      print('Middleware 2 interno executado antes da requisição');
      final resp =
          await innerHandler(request); //passa para o proximo middleware
      print('Middleware 2 interno executado após da requisição');
      return resp;
    });
  }).addHandler(rota);

//apenas uns exemplos
  rota.get('/menu', menu);
  final controller = Controller();
  rota.mount('/controller/', controller.rota);
  //arquitetura das rotas do projeto está no application_config

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8081');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
