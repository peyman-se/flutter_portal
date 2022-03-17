// NOTE adapted from Flutter beta 2.11.0-0.1.pre (notice beta, not stable)
// Please place a `NOTE MODIFIED` marker whenever you change the Flutter code

// ignore_for_file: unnecessary_null_comparison, diagnostic_describe_all_properties

import 'package:flutter/material.dart';
import '../anchor.dart';
import '../portal_link.dart';
import 'rendering_layer.dart';
import 'rendering_proxy_box.dart';

/// @nodoc
class CustomCompositedTransformTarget extends SingleChildRenderObjectWidget {
  /// @nodoc
  const CustomCompositedTransformTarget({
    Key? key,
    required this.link,
    required this.debugLabel,
    Widget? child,
  })  : assert(link != null),
        super(key: key, child: child);

  /// @nodoc
  final CustomLayerLink link;

  // NOTE MODIFIED add
  final String? debugLabel;

  @override
  CustomRenderLeaderLayer createRenderObject(BuildContext context) {
    return CustomRenderLeaderLayer(
      link: link,
      debugLabel: debugLabel,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, CustomRenderLeaderLayer renderObject) {
    renderObject
      ..link = link
      ..debugLabel = debugLabel;
  }
}

/// @nodoc
class CustomCompositedTransformFollower extends SingleChildRenderObjectWidget {
  /// @nodoc
  const CustomCompositedTransformFollower({
    Key? key,
    required this.link,
    // NOTE MODIFIED some arguments
    required this.portalLink,
    required this.targetSize,
    required this.anchor,
    required this.debugLabel,
    Widget? child,
  }) : super(key: key, child: child);

  /// @nodoc
  final Anchor anchor;

  /// @nodoc
  final CustomLayerLink link;

  /// @nodoc
  final PortalLink portalLink;

  /// @nodoc
  final Size targetSize;

  // NOTE MODIFIED add
  final String? debugLabel;

  @override
  CustomRenderFollowerLayer createRenderObject(BuildContext context) {
    return CustomRenderFollowerLayer(
      anchor: anchor,
      link: link,
      portalLink: portalLink,
      targetSize: targetSize,
      debugLabel: debugLabel,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, CustomRenderFollowerLayer renderObject) {
    renderObject
      ..link = link
      ..portalLink = portalLink
      ..targetSize = targetSize
      ..anchor = anchor
      ..debugLabel = debugLabel;
  }
}
