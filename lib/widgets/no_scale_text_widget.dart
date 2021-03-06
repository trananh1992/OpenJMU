import 'dart:math' as math;

import 'package:flutter/material.dart';

class NoScaleTextWidget extends StatelessWidget {
  const NoScaleTextWidget({@required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaleTextWidget(
      scale: 1.0,
      child: child,
    );
  }
}

class MaxScaleTextWidget extends StatelessWidget {
  const MaxScaleTextWidget({
    this.max = 1.0,
    @required this.child,
  });

  final double max;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double scale = math.min(max, data.textScaleFactor);
    return MediaQuery(
      data: data.copyWith(textScaleFactor: scale),
      child: child,
    );
  }
}

class ScaleTextWidget extends StatelessWidget {
  const ScaleTextWidget({
    Key key,
    @required this.scale,
    @required this.child,
  }) : super(key: key);

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    final double scale = this.scale ?? data.textScaleFactor;
    return MediaQuery(
      data: data.copyWith(textScaleFactor: scale),
      child: child,
    );
  }
}
