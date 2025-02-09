import 'package:flutter_widgets_practice/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final app_router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),
     GoRoute(
      path: '/snackbar',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),
  ],
);
