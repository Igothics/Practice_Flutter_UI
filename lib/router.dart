import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice_flutter_ui/homepage.dart';
import 'package:practice_flutter_ui/page01.dart';

final router = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: "/Page01",
    builder: (context, state) => const Page01(),
  ),
]);

Route createRoute() => PageRouteBuilder(
    transitionDuration: const Duration(seconds: 1),
    pageBuilder: (context, animation, secondAnimation) => const Page01(),
    transitionsBuilder: (context, animation, secondAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOutCubicEmphasized;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    });
