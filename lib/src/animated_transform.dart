/*
 * @Description:翻转动画
 * @Author: zhubiao
 * @Date: 2022-10-28 16:25:35
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:router_animations/src/router_animations_constant.dart';

class AnimatedTransform extends AnimatedWidget {
  const AnimatedTransform(
    this.fontWidget,
    this.backWidget,
    this.transitionsType, {
    Key? key,
    required Animation<double> position,
  }) : super(key: key, listenable: position);

  ///正面widget
  final Widget? fontWidget;

  ///反面widget
  final Widget? backWidget;

  ///动画类型
  final TransitionsType transitionsType;

  Animation<double> get position => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Transform(
        alignment: Alignment.center,
        transform: transitionsType.matrix4Value(pi * position.value),
        child: position.value <= 0.5
            ? fontWidget
            : Transform(
                alignment: Alignment.center,
                transform: transitionsType.matrix4Value(pi),
                child: backWidget,
              ),
      ),
    );
  }
}
