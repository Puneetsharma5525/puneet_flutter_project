import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart' as go;
import '../../presentation/Bloc_Apis/logic/item_list_bloc.dart';
import '../../presentation/Bloc_Apis/screen/itemListScreen.dart';
import '../../presentation/Bloc_Practice/screen/CounterScreen.dart';
import '../../presentation/Bloc_Practice/screen/SliderScreen.dart';
import '../../presentation/HomePage/screen/HomePage.dart';
import '../DependencyInjection.dart';

class RouteGo {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  static String splashScreen = '/';
  static String homePage = 'homePage';
  static String counterScreen = 'counterScreen';
  static String sliderScreen = 'sliderScreen';
  static String blocApisScreen = 'blocApisScreen';
  GoRouter returnRouter() {
    GoRouter pages = GoRouter(
      navigatorKey: rootNavigatorKey,
      // debugLogDiagnostics: true,
      initialLocation: '$splashScreen$homePage',
      routes: <RouteBase>[
        GoRoute(
          name: homePage,
          path: '/$homePage',
          pageBuilder: (context, state) => customTransitionPage(
            state,
            const HomePage(),
          ),
        ),
        GoRoute(
          name: counterScreen,
          path: '/$counterScreen',
          pageBuilder: (context, state) => customTransitionPage(
            state,
            const CounterScreen(),
          ),
        ),
        GoRoute(
          name: sliderScreen,
          path: '/$sliderScreen',
          pageBuilder: (context, state) => customTransitionPage(
            state,
            const SliderScreen(),
          ),
        ),GoRoute(
          name: blocApisScreen,
          path: '/$blocApisScreen',
          pageBuilder: (context, state) => customTransitionPage(
            state, BlocProvider(
              create: (BuildContext context) =>
              ItemListBloc(getIt())..add(const ItemListEvent(refresh: true)),
              child: const BlocApisScreen()),
          ),
        ),
      ],
      errorPageBuilder: (context, state) => const MaterialPage(
          child: Scaffold(
        body: Center(
          child: Text('Screen Path Error'),
        ),
      )),
    );
    return pages;
  }

  go.CustomTransitionPage<void> customTransitionPage(
      GoRouterState state, Widget widget) {
    return go.CustomTransitionPage<void>(
      key: state.pageKey,
      child: widget,
      transitionDuration: const Duration(milliseconds: 1000),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn,
        );
        return Align(
          alignment: Alignment.centerRight,
          child: SizeTransition(
            axis: Axis.horizontal,
            sizeFactor: animation,
            axisAlignment: 0,
            child: child,
          ),
        );
      },
      barrierDismissible: true,
      barrierColor: Colors.black38,
      opaque: false,
    );
  }
}
