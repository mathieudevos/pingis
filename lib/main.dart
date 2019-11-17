import 'package:flutter/material.dart';
import 'package:pingis/router.dart';
import 'package:pingis/state/services/auth.service.dart';
import 'package:provider/provider.dart';
import 'components/screens/home.screen.dart';
import 'components/screens/auth.screen.dart';
import 'components/screens/splash.screen.dart';
import 'utils/theme.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: THEME_LIGHT,
  darkTheme: THEME_DARK,
  initialRoute: '/',
  onGenerateRoute: Router.generateRoute,
  home: PingisApp(),
));


class PingisApp extends StatelessWidget {
  // Root widget
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => AuthService(),
      child: Selector<AuthService, AuthenticationStatus>(
        selector: (_, authService) => authService.status,
        builder: (_, status, __) {
          switch (status) {
            case AuthenticationStatus.Unitialized:
              return SplashScreen();
            case AuthenticationStatus.Authenticating:
            case AuthenticationStatus.Unauthenticated:
              return AuthScreen();
            case AuthenticationStatus.Authenticated:
              return HomeScreen();
            default:
              return const Center(child: Text('Status not applicable'));
          }
        }
      ),
    );
  }
}
