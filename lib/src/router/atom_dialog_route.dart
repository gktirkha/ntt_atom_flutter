import 'package:flutter/material.dart';

/// A custom popup route that displays a dialog with optional animations and configurations.
///
/// This route allows for flexible dialog display with customizable transitions,
/// barrier properties, and anchor positioning.
class AtomDialogRoute<T> extends PopupRoute<T> {
  /// Creates an [AtomDialogRoute].
  ///
  /// - [pageBuilder]: Builds the content of the dialog.
  /// - [barrierDismissible]: Determines if tapping outside the dialog dismisses it. Default is `false`.
  /// - [barrierColor]: The background color behind the dialog. Default is a semi-transparent black.
  /// - [barrierLabel]: A label for accessibility purposes.
  /// - [transitionDuration]: The duration of the transition animation. Default is `200ms`.
  /// - [transitionBuilder]: A custom transition animation builder.
  /// - [anchorPoint]: Specifies a point to align the dialog.
  /// - [settings]: The route settings.
  /// - [requestFocus]: Whether the route should request focus when pushed.
  /// - [traversalEdgeBehavior]: Defines how the focus traversal should behave.
  AtomDialogRoute({
    required RoutePageBuilder pageBuilder,
    bool barrierDismissible = false,
    Color? barrierColor = const Color(0x80000000),
    String? barrierLabel,
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder? transitionBuilder,
    super.settings,
    super.requestFocus,
    this.anchorPoint,
    super.traversalEdgeBehavior,
  }) : _pageBuilder = pageBuilder,
       _barrierDismissible = barrierDismissible,
       _barrierLabel = barrierLabel,
       _barrierColor = barrierColor,
       _transitionDuration = transitionDuration,
       _transitionBuilder = transitionBuilder;

  /// Builds the dialog content.
  final RoutePageBuilder _pageBuilder;

  /// Determines whether the dialog can be dismissed by tapping outside.
  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  /// Provides an accessibility label for the dialog barrier.
  @override
  String? get barrierLabel => _barrierLabel;
  final String? _barrierLabel;

  /// The background color of the modal barrier.
  @override
  Color? get barrierColor => _barrierColor;
  final Color? _barrierColor;

  /// The duration of the transition animation.
  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  /// A custom transition builder for the dialog.
  final RouteTransitionsBuilder? _transitionBuilder;

  /// An optional anchor point to position the dialog.
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
