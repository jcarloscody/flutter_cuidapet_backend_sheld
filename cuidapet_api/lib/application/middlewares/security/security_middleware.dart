// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:cuidapet_api/application/helpers/jwt_helper.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';

import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:cuidapet_api/application/middlewares/middlewares.dart';
import 'package:cuidapet_api/application/middlewares/security/security_skip_url.dart';

class SecurityMiddleware extends Middlewares {
  final ILogger iLogger;
  SecurityMiddleware({
    required this.iLogger,
  });
  final skypUrl = <SecuritySkipUrl>[];
  @override
  FutureOr<Response> execute(Request request) {
    if (skypUrl.contains(
        SecuritySkipUrl(url: '/${request.url}', method: request.method))) {
      //sem validações. aqui temos url que é desnecessário fazer validaões como por exemplo criar um login
      return innerHandler(request);
    }

    final authHeader = request.headers['Authorization'];

    if (authHeader == null || authHeader.isEmpty) {
      //acesso negado
      return Response.forbidden(jsonEncode({}));
    }

    //exemplo de token
    //Bearer 1oqiwoivn2oi3nfo.voaivoi2no3no24oi2n3o2vqonf2o3o.vaowiemvoqi2n3o2oinqoino

    final authHeaderContent = authHeader.split(' ');

    if (authHeaderContent[0] != 'Bearer') {
      return Response.forbidden(jsonEncode({}));
    }

    final authorizationToken = authHeaderContent[1];

    final claims = JwtHelper.getClaims(authorizationToken);
    try {
      //refresh token: pegamos um token expirado e mandamos para servidor
      if (request.url.path != 'auth/refresh') {
        claims.validate();
      }
      final claimsMap = claims.toJson();
      final userId = claimsMap['sub'];
      final supplierId = claimsMap['supplier'];
      if (userId == null) {
        throw JwtException.invalidToken;
      }

      final securityHeaders = {
        'sub': userId,
        'access_token': authorizationToken,
        'supplier': supplierId
      };

      return innerHandler(request.change(
        headers: securityHeaders,
      ));
    } on JwtException catch (e, s) {
      iLogger.error('Erro no TOKEN');
      return Response.forbidden(jsonEncode({}));
    } catch (e, s) {
      iLogger.error('Erro no interno');

      return Response.forbidden(jsonEncode({}));
    }
  }
}
