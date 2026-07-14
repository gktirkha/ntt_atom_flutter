import 'package:flutter/material.dart';

/// A [PageRoute] used by the Atom SDK to present the checkout WebView page
/// as a full-screen, opaque route.
class AtomPageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
  /// Creates a page route that builds its content with [builder].
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

  /// Builds the page's content.
  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  Widget buildContent(BuildContext context) => builder(context);
}
