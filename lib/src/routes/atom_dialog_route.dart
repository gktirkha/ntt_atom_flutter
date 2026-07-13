import 'package:flutter/material.dart';

class AtomDialogRoute<T> extends PopupRoute<T> {
  AtomDialogRoute({
    required this._pageBuilder,
    this._barrierDismissible = false,
    this._barrierColor = const Color(0x80000000),
    this._barrierLabel,
    this._transitionDuration = const Duration(milliseconds: 200),
    this._transitionBuilder,
    super.settings,
    super.requestFocus,
    this.anchorPoint,
    super.traversalEdgeBehavior,
  });

  final RoutePageBuilder _pageBuilder;

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  String? get barrierLabel => _barrierLabel;
  final String? _barrierLabel;

  @override
  Color? get barrierColor => _barrierColor;
  final Color? _barrierColor;

  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  final RouteTransitionsBuilder? _transitionBuilder;

  final Offset? anchorPoint;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: DisplayFeatureSubScreen(
        anchorPoint: anchorPoint,
        child: _pageBuilder(context, animation, secondaryAnimation),
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (_transitionBuilder == null) {
      return FadeTransition(opacity: animation, child: child);
    }
    return _transitionBuilder(context, animation, secondaryAnimation, child);
  }
}
