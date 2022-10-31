/*
 * @Description: 
 * @Author: zhubiao
 * @Date: 2022-10-31 11:21:25
 */
import 'package:flutter/material.dart';
import 'package:router_animations/src/animated_router_base.dart';
import 'package:router_animations/src/router_animations_constant.dart';

class AnimatedSlideTransition extends AnimatedRouterBase<double> {
  AnimatedSlideTransition(
    super.child,
    super.transitionsType,
    super.currentPageContext,
    super.animation,
  );
  @override
  Widget animatedBuild() {
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
      child: child,
    );
  }
}
