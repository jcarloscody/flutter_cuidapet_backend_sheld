import 'dart:async';

import 'package:shelf/shelf.dart';

abstract class Middlewares {
  late Handler innerHandler;

  Handler handler(Handler innerHandler) {
    this.innerHandler = innerHandler;
    return execute;
  }

  FutureOr<Response> execute(Request request);
}
