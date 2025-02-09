import 'package:flutter/material.dart';
import 'package:flutter_widgets_practice/config/router/app_router.dart';
import 'package:flutter_widgets_practice/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: app_router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 0).getTheme(),      
    );
  }
}
