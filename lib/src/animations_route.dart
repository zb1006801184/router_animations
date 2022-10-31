/*
 * @Description: 
 * @Author: zhubiao
 * @Date: 2022-10-31 15:05:51
 */
import 'package:flutter/material.dart';
import 'package:router_animations/src/animated_transform.dart';
import 'package:router_animations/src/router_animations_constant.dart';

class AnimationsRoute extends PageRoute {
  final Widget child;
  final TransitionsType transitionsType;
  final BuildContext currentPageContext;
  final Widget fontWidget;
  AnimationsRoute(
    this.child, {
    required this.currentPageContext,
    required this.transitionsType,
    required this.fontWidget,
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
  Duration get transitionDuration => const Duration(milliseconds: 6000);

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
        return transform(animation, currentPageContext,child,transitionsType);
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
      currentPageContext.findAncestorWidgetOfExactType() ?? Container(color: Colors.red,),
      page,
      transitionsType,
      position: animation,
    );
  }
}
