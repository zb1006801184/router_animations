import 'package:flutter/material.dart';
import 'package:router_animations/src/animated_transform_x.dart';
import 'package:router_animations/src/animated_transform_y.dart';

enum TransitionsType {
  ///从左到右
  leftToRight,

  ///从右到左
  rightToLeft,

  ///从上到下
  topToBottom,

  ///从下到上
  bottomToTop,

  ///缩放
  scale,

  ///透明
  fade,

  ///旋转
  rotation,

  ///上下翻转
  transformY,

  ///左右翻转
  transformX
}

class AnimationsRoute extends PageRoute {
  final Widget child;
  final TransitionsType transitionsType;
  final Widget currentPage;
  AnimationsRoute(
    this.child, {
    required this.currentPage,
    required this.transitionsType,
  }) : super();

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (transitionsType) {
      case TransitionsType.leftToRight:
        return leftToRight(animation);
      case TransitionsType.rightToLeft:
        return rightToLeft(animation);
      case TransitionsType.topToBottom:
        return topToBottom(animation);
      case TransitionsType.bottomToTop:
        return bottomToTop(animation);
      case TransitionsType.scale:
        return scale(animation);
      case TransitionsType.fade:
        return fade(animation);
      case TransitionsType.rotation:
        return rotation(animation);
      case TransitionsType.transformY:
        return transformY(animation, child);
      case TransitionsType.transformX:
        return transformX(animation, child);
      default:
    }
    return SlideTransition(
      position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: this.child,
    );
  }

  Widget leftToRight(Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }

  Widget rightToLeft(Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: const Offset(-1.0, 0.0), end: const Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }

  Widget topToBottom(Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }

  Widget bottomToTop(Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
      child: child,
    );
  }

  ///缩放
  Widget scale(Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  ///透明

  Widget fade(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  ///旋转

  Widget rotation(Animation<double> animation) {
    return RotationTransition(
      turns: animation,
      child: child,
    );
  }

  Widget transformY(Animation<double> animation, Widget backWidget) {
    return AnimatedTransformY(
      currentPage,
      child,
      animation: animation,
    );
  }

  Widget transformX(Animation<double> animation, Widget backWidget) {
    return AnimatedTransformX(
      currentPage,
      child,
      animation: animation,
    );
  }
}
