

import 'package:autenticacion/config/router/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: "/",
      builder: (context, state) => const HomeScreen(),
      ),
    GoRoute(
      name: AutenticacionScreen.name,
      path: "/autenticacion",
      builder: (context, state) => const AutenticacionScreen(),
      ),
    
  ]
  );