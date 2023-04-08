import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/utils/common.dart';

class FlowMenuDelegate extends FlowDelegate {
  final BuildContext ctx;

  FlowMenuDelegate({required this.controller, required this.ctx})
      : super(repaint: controller);

  final Animation<double> controller;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return controller != oldDelegate.controller;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount - 1; i++) {
      final radius = 80 * controller.value;
      // final theta = i * pi * 0.5 / (context.childCount - 2);
      // final x = radius * cos(theta);
      // final y = radius * sin(theta);

      context.paintChild(i,
          transform: Matrix4.translationValues(
              widthQuery(ctx, 84), heightQuery(ctx, 86) - radius * (i + 1), 0));
    }

    context.paintChild(context.childCount - 1,
        transform: Matrix4.translationValues(
            widthQuery(ctx, 84), heightQuery(ctx, 86), 0));
  }
}
