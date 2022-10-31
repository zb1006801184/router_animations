import 'package:flutter/material.dart';
import 'package:router_animations/src/animated_slide.dart';
import 'package:router_animations/src/animated_transform_x.dart';
import 'package:router_animations/src/animated_transform_y.dart';
import 'package:router_animations/src/router_animations_constant.dart';

class AnimationsRoute extends PageRoute {
  final Widget child;
  final TransitionsType transitionsType;
  final BuildContext currentPageContext;
  AnimationsRoute(
    this.child, {
    required this.currentPageContext,
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
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (transitionsType) {
      case TransitionsType.leftToRight:
      case TransitionsType.rightToLeft:
      case TransitionsType.topToBottom:
      case TransitionsType.bottomToTop:
        return _silde(animation);
      case TransitionsType.scale:
        return _scale(animation);
      case TransitionsType.fade:
        return _fade(animation);
      case TransitionsType.rotation:
        return _rotation(animation);
      case TransitionsType.transformY:
        return _transformY(animation, child);
      case TransitionsType.transformX:
        return _transformX(animation, child);
      default:
        return _silde(animation);
    }
  }

  Widget _silde(Animation<double> animation) {
    return AnimatedSlideTransition(
      child,
      transitionsType,
      currentPageContext,
      animation,
    ).animatedBuild();
  }

  ///缩放
  Widget _scale(Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  ///透明
  Widget _fade(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  ///旋转
  Widget _rotation(Animation<double> animation) {
    return RotationTransition(
      turns: animation,
      child: child,
    );
  }

  Widget _transformY(Animation<double> animation, Widget backWidget) {
    return AnimatedTransformY(
      currentPageContext.findAncestorWidgetOfExactType() ?? Container(),
      child,
      animation: animation,
    );
  }

  Widget _transformX(Animation<double> animation, Widget backWidget) {
    return AnimatedTransformX(
      currentPageContext.findAncestorWidgetOfExactType() ?? Container(),
      child,
      animation: animation,
    );
  }
}
