import 'package:flutter/material.dart';

import 'atom_dialog_route.dart';
import 'atom_page_route.dart';

/// A custom [NavigatorObserver] that keeps track of the navigation stack.
///
/// This observer maintains a list of active routes and provides
/// a method to close all Atom-related routes when needed.
class AtomNavigatorObserver extends NavigatorObserver {
  /// A stack that holds the active routes in the navigation.
  static final List<Route<dynamic>> _routeStack = [];

  /// Called when a new route is pushed onto the navigator stack.
  ///
  /// - [route]: The newly pushed route.
  /// - [previousRoute]: The previous route before the new one was pushed.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route.isValidAtomRoute) {
      _routeStack.add(route);
    }
  }

  /// Called when a route is popped from the navigator stack.
  ///
  /// - [route]: The route being popped.
  /// - [previousRoute]: The route that is now visible after the pop.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (route.isValidAtomRoute) {
      _routeStack.remove(route);
    }
  }

  /// Called when a route is replaced with another.
  ///
  /// - [newRoute]: The new route that replaces the old one.
  /// - [oldRoute]: The route being replaced.
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

  /// Closes all Atom-related SDK routes ([AtomPageRoute] and [AtomDialogRoute]).
  ///
  /// This method removes all Atom-specific routes from the navigator stack
  /// and ensures they are properly disposed of.
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

/// Extension to Check if route is atom sdk route or not
extension AtomRouteValidatorExtension on Route? {
  /// Checks if the route is a valid Atom route.
  ///
  /// Returns `true` if the route is either an `AtomDialogRoute` or `AtomPageRoute`, otherwise returns `false`.
  bool get isValidAtomRoute {
    if (this == null) return false;
    return (this is AtomDialogRoute || this is AtomPageRoute);
  }
}
