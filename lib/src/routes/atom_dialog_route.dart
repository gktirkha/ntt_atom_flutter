import 'package:flutter/material.dart';

/// A [PopupRoute] used by the Atom SDK to present dialogs (such as the
/// pre-processor and close-confirmation dialogs) above the current page.
class AtomDialogRoute<T> extends PopupRoute<T> {
  /// Creates a dialog route that builds its content with [_pageBuilder].
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

  /// The point used to select which screen the dialog appears on in a
  /// multi-display layout.
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
