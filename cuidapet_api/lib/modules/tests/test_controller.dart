import 'dart:async';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'test_controller.g.dart';

class TestController {
  @Route.get('/')
  Future<Response> find(Request request) async {
    return Response.ok(jsonEncode('{"message":"hello"}'));
  }

  Router get router => _$TestControllerRouter(this);
}
