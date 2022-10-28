/*
 * @Description: X轴翻转动画 
 * @Author: zhubiao
 * @Date: 2022-10-28 16:25:24
 */
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedTransformX extends AnimatedWidget {
  final Widget fontWidget;
  final Widget backWidget;

  const AnimatedTransformX(
    this.fontWidget,
    this.backWidget, {
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Container(
      color: Colors.white,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..rotateX(pi * animation.value),
        child: animation.value <= 0.5
            ? fontWidget
            : Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateX(pi),
                child: backWidget,
              ),
      ),
    );
  }
}
