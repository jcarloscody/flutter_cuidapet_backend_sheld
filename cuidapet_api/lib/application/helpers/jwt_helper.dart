import 'package:cuidapet_api/application/config/application_config.dart';
import 'package:dotenv/dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtHelper {
  static final String _jwtSecret = env['jwt_secret'] ?? env['jwtSecret']!;
  JwtHelper._();

//validar o token
  static JwtClaim getClaims(String token) {
    //os claims são o payload
    return verifyJwtHS256Signature(token, _jwtSecret);
  }
}
