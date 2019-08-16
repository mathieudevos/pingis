import 'package:flutter/material.dart';
import 'package:pingis/state/services/auth.service.dart';
import 'package:provider/provider.dart';
import 'components/screens/home.screen.dart';
import 'components/screens/login.screen.dart';
import 'components/screens/splash.screen.dart';
import 'utils/theme.dart';

void main() => runApp(PingisApp());

class PingisApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: THEME_LIGHT,
      darkTheme: THEME_DARK,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => AuthService()),
        ],
        child: Consumer<AuthService>(
          builder: (context, authService, _) {
            switch (authService.status) {
              case AuthenticationStatus.Unitialized:
                return SplashScreen();
              case AuthenticationStatus.Authenticating:
              case AuthenticationStatus.Unauthenticated:
                return LoginScreen();
              case AuthenticationStatus.Authenticated:
                return HomeScreen();
              default:
                return const Center(child: Text('Status not applicable'));
            }
          }
        )
      ),
    );
  }
}
