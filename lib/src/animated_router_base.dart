/*
 * @Description: 动画的基础属性和接口
 * @Author: zhubiao
 * @Date: 2022-10-31 11:27:47
 */
import 'package:flutter/material.dart';
import 'package:router_animations/src/router_animations_constant.dart';

abstract class AnimatedRouterBase<T> {
  late Widget child;
  late TransitionsType transitionsType;
  late BuildContext currentPageContext;
  late Animation<T> animation;
  void animatedBuild() {}
  AnimatedRouterBase(
    this.child,
    this.transitionsType,
    this.currentPageContext,
    this.animation,
  );
}
