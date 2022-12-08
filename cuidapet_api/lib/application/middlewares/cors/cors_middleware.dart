import 'dart:io';

import 'package:cuidapet_api/application/middlewares/middlewares.dart';
import 'package:shelf/src/response.dart';
import 'package:shelf/src/request.dart';

class CorsMiddleware extends Middlewares {
  final Map<String, String> headers = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET, POST, PATCH, PUT, DELETE, OPTIONS",
    "Access-Control-Allow-Header":
        "${HttpHeaders.contentTypeHeader}, ${HttpHeaders.authorizationHeader}",
  };
  @override
  Future<Response> execute(Request request) async {
    //iniciando CrossDomain
    if (request.method == "OPTIONS") {
      //passando para o client os headers
      return Response(HttpStatus.ok, headers: headers);
    }
    //executando a funcao cross
    final resp = await innerHandler(request);

    //respondendo para o client e passando novamente os headrs
    return resp.change(headers: headers);
  }
}
