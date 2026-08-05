import 'package:go_router/go_router.dart';

import 'demos/en_bottom_navigation_bar_demo.dart';
import 'demos/en_box_decoration_demo.dart';
import 'demos/en_decoration_image_demo.dart';
import 'demos/en_expansion_panel_demo.dart';
import 'demos/en_stepper_demo.dart';
import 'home_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: AppRoutes.expansionPanel,
          builder: (context, state) => const EnExpansionPanelDemo(),
        ),
        GoRoute(
          path: AppRoutes.stepper,
          builder: (context, state) => const EnStepperDemo(),
        ),
        GoRoute(
          path: AppRoutes.bottomNavigationBar,
          builder: (context, state) => const EnBottomNavigationBarDemo(),
        ),
        GoRoute(
          path: AppRoutes.boxDecoration,
          builder: (context, state) => const EnBoxDecorationDemo(),
        ),
        GoRoute(
          path: AppRoutes.decorationImage,
          builder: (context, state) => const EnDecorationImageDemo(),
        ),
      ],
    ),
  ],
);

/// Child route path segments (relative to `/`).
abstract final class AppRoutes {
  static const expansionPanel = 'expansion-panel';
  static const stepper = 'stepper';
  static const bottomNavigationBar = 'bottom-navigation-bar';
  static const boxDecoration = 'box-decoration';
  static const decorationImage = 'decoration-image';

  static const expansionPanelPath = '/$expansionPanel';
  static const stepperPath = '/$stepper';
  static const bottomNavigationBarPath = '/$bottomNavigationBar';
  static const boxDecorationPath = '/$boxDecoration';
  static const decorationImagePath = '/$decorationImage';
}
