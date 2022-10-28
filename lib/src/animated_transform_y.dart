/*
 * @Description:Y轴翻转动画
 * @Author: zhubiao
 * @Date: 2022-10-28 16:25:35
 */
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedTransformY extends AnimatedWidget {
  final Widget fontWidget;
  final Widget backWidget;

 const AnimatedTransformY(
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
        transform: Matrix4.identity()..rotateY(pi * animation.value),
        child: animation.value <= 0.5
            ? fontWidget
            : Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(pi),
                child: backWidget,
              ),
      ),
    );
  }
}