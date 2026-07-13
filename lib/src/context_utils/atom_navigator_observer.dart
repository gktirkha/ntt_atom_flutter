import 'package:flutter/material.dart';

import '../routes/atom_dialog_route.dart';
import '../routes/atom_page_route.dart';

class AtomNavigatorObserver extends NavigatorObserver {
  static final List<Route<dynamic>> _routeStack = [];

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.isValidAtomRoute) {
      _routeStack.add(route);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.isValidAtomRoute) {
      _routeStack.remove(route);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null && oldRoute.isValidAtomRoute) {
      _routeStack.remove(oldRoute);
    }
    if (newRoute != null && newRoute.isValidAtomRoute) {
      _routeStack.add(newRoute);
    }
  }

  void closeAtomSDK() {
    _routeStack.removeWhere((route) {
      if (route is AtomPageRoute || route is AtomDialogRoute) {
        navigator?.removeRoute(route);
        return true;
      }
      return false;
    });
  }
}

extension _AtomRouteValidatorExtension on Route? {
  bool get isValidAtomRoute {
    if (this == null) return false;
    return (this is AtomDialogRoute || this is AtomPageRoute);
  }
}
