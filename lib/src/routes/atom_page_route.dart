import 'package:flutter/material.dart';

class AtomPageRoute<T> extends PageRoute<T>
    with MaterialRouteTransitionMixin<T> {
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

  final WidgetBuilder builder;

  @override
  final bool maintainState;

  @override
  Widget buildContent(BuildContext context) => builder(context);
}
