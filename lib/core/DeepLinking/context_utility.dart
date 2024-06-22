import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_project/core/Router/Router.dart';

class ContextUtility{
  static GlobalKey<NavigatorState> get navigatorKey => RouteGo.rootNavigatorKey;
  static  NavigatorState? get navigator => navigatorKey.currentState;
  static BuildContext? get context => navigator?.overlay?.context;
}