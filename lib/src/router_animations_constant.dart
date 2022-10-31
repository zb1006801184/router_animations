/*
 * @Description: 常量
 * @Author: zhubiao
 * @Date: 2022-10-31 10:50:31
 */
import 'package:flutter/material.dart';

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

extension TransitionsValue on TransitionsType {
  Offset get offsetBeginValue {
    switch (this) {
      case TransitionsType.leftToRight:
        return const Offset(1.0, 0);
      case TransitionsType.rightToLeft:
        return const Offset(-1.0, 0);
      case TransitionsType.topToBottom:
        return const Offset(0, -1.0);
      case TransitionsType.bottomToTop:
        return const Offset(0, 1.0);
      default:
        return const Offset(0, 0);
    }
  }

  Matrix4 matrix4Value (double value){
    switch (this) {
      case TransitionsType.transformX:
        return Matrix4.identity()..rotateX(value);
      case TransitionsType.transformY:
        return Matrix4.identity()..rotateY(value);
      default:
        return Matrix4.identity();
    }
  }
}
