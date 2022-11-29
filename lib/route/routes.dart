import 'package:flutter/material.dart';
import 'package:sesion9/index.dart';

class MyRoutes {
  static const String rHOME = '/home';
  static const String rCONFIG = '/config';
  static const String rPERFIL = '/perfil';
  static const String rLOGIN = '/login';
  static const String rREGISTER = '/register';
  static const String rVerify = '/verify';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomePage());
      case ('/config'):
        return MaterialPageRoute(builder: (_) => const ConfigPage());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const PerfilPage());
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ('/register'):
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case ('/verify'):
        return MaterialPageRoute(builder: (_) => const VerificarAuth());
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}
