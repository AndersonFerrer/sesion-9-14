import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion9/preference/preferences.dart';
import 'package:sesion9/provider/login_provider.dart';
import 'package:sesion9/provider/theme_provider.dart';
import 'package:sesion9/route/routes.dart';
import 'package:sesion9/services/service_auth.dart';
import 'package:sesion9/services/snapbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkMode: Preferences.theme),
      ),
      ChangeNotifierProvider(create: (_) => AuthService()),
      ChangeNotifierProvider(create: (_) => LoginProvider())
    ],
    child: const MyApp(),
  ));
/*     const MyApp() */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: CustomSnapBar.msgkey,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rVerify,
      /* home: const HomePage(), */
    );
  }
}
