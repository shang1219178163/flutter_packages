import 'package:route_stack_manager_example/util/app_navigator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:route_stack_manager/route_stack_manager.dart';

void main() {
  RouteManager().isDebug = kDebugMode;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Route Manager',
      navigatorKey: AppNavigator.navigatorKey,
      navigatorObservers: [
        RouteManagerObserver(),
      ],
      initialRoute: AppRouter.initial,
      routes: AppRouter.routeMap,
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          settings: settings,
          builder: AppNavigator.unknownPageBuilder,
        );
      },
      theme: buildTheme(),
    );
  }

  ThemeData? buildTheme() {
    const primary = Colors.blue;
    return ThemeData(
      primarySwatch: primary,
      colorScheme: ColorScheme.fromSeed(seedColor: primary),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          side: WidgetStateProperty.all(const BorderSide(color: primary, width: 1)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: WidgetStateProperty.all(primary),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
      ),
    );
  }
}
