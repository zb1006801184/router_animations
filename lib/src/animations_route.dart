/*
 * @Description: 
 * @Author: zhubiao
 * @Date: 2022-10-31 15:05:51
 */
import 'package:flutter/material.dart';
import 'package:router_animations/src/animated_transform.dart';
import 'package:router_animations/src/router_animations_constant.dart';

class AnimationsRoute extends PageRoute {
  AnimationsRoute(
    this.page, {
    required this.currentPageContext,
    required this.transitionsType,
    this.animatedTransitionDuration = const Duration(milliseconds: 300),
  })  : assert(animatedTransitionDuration != null),
        super();

  ///当前页面
  final Widget page;

  ///转场动画类型
  final TransitionsType transitionsType;

  ///当前页面上下文
  final BuildContext currentPageContext;

  ///动画时间
  final Duration? animatedTransitionDuration;

  @override
  Color? barrierColor;

  @override
  String? barrierLabel;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return page;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => animatedTransitionDuration!;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (transitionsType) {
      case TransitionsType.leftToRight:
      case TransitionsType.rightToLeft:
      case TransitionsType.topToBottom:
      case TransitionsType.bottomToTop:
        return silde(animation, transitionsType, child);
      case TransitionsType.scale:
        return ScaleTransition(scale: animation, child: child);
      case TransitionsType.fade:
        return FadeTransition(opacity: animation, child: child);
      case TransitionsType.rotation:
        return RotationTransition(turns: animation, child: child);
      case TransitionsType.transformY:
      case TransitionsType.transformX:
        return transform(animation, currentPageContext, child, transitionsType);
      default:
        return silde(animation, transitionsType, child);
    }
  }

  ///平移转场动画
  ///[animation]
  ///[transitionsType] 动画类型
  ///[page] 下个页面
  static Widget silde(
    Animation<double> animation,
    TransitionsType transitionsType,
    Widget page,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: transitionsType.offsetBeginValue,
        end: const Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: page,
    );
  }

  ///
  ///[animation]
  ///[currentPageContext]当前页面的上下文，用于获取当前页面widget
  ///[page]要跳转的页面
  ///[transitionsType]转场动画类型
  ///
  static Widget transform(
    Animation<double> animation,
    BuildContext currentPageContext,
    Widget page,
    TransitionsType transitionsType,
  ) {
    return AnimatedTransform(
      currentPageContext.findRootAncestorStateOfType()?.widget,
      page,
      transitionsType,
      position: animation,
    );
  }
}
