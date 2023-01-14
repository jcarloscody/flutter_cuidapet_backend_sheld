import 'dart:async';
import 'dart:io';

import 'package:cuidapet_api/application/config/application_config.dart';
import 'package:cuidapet_api/application/middlewares/cors/cors_middleware.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

final rota = Router();
void main(List<String> args) async {
  //carregar as configurações do aplicativo
  ApplicationConfig.loadConfigApplication(rota: rota);

  // Configure a pipeline that logs requests.
  final handler = handlers(rota);

  initServer(handler);
}

Handler handlers(Router rota) {
  final cors = CorsMiddleware();
  final hand = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware((innerHandler) {
        print('Middleware 1 Executando');
        return ((request) async {
          print('Middleware 1 interno executado antes da requisição');
          //return Response.ok('Nao passa ningue');
          final resp =
              await innerHandler(request); //passa para o proximo middleware
          print('Middleware 1 interno executado após da requisição');
          return resp;
        });
      })
      .addMiddleware((innerHandler) {
        print('Middleware 2 Executando');
        return ((request) async {
          print('Middleware 2 interno executado antes da requisição');
          final resp =
              await innerHandler(request); //passa para o proximo middleware
          print('Middleware 2 interno executado após da requisição');
          return resp;
        });
      })
      .addMiddleware(cors.handler)
      .addHandler(rota);

  return hand;
}

Future<void> initServer(Handler handler) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;
  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8081');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
