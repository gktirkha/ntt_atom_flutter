import 'package:flutter/material.dart';

/// A custom page route that provides transitions similar to [MaterialPageRoute].
///
/// This route is designed for navigation within the Atom SDK,
/// supporting state maintenance and fullscreen dialog options.
class AtomPageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  /// Creates an [AtomPageRoute].
  ///
  /// - [builder]: The widget builder for the page content.
  /// - [settings]: The route settings.
  /// - [requestFocus]: Whether the route should request focus when pushed.
  /// - [maintainState]: Whether the route should remain in memory when inactive.
  /// - [fullscreenDialog]: Whether the page is presented as a fullscreen dialog.
  /// - [allowSnapshotting]: Whether snapshotting is allowed for restoration.
  /// - [barrierDismissible]: Whether tapping outside should dismiss the page.
  AtomPageRoute({
    required this.builder,
    super.settings,
    super.requestFocus,
    this.maintainState = true,
    super.fullscreenDialog,
    super.allowSnapshotting = true,
    super.barrierDismissible = false,
  }) {
    assert(opaque, 'AtomPageRoute must be opaque.');
  }

  /// The builder function that creates the page content.
  final WidgetBuilder builder;

  /// Whether the route remains in memory when inactive.
  @override
  final bool maintainState;

  /// Builds the content of the page.
  @override
  Widget buildContent(BuildContext context) => builder(context);
}
