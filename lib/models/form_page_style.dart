// Create a class FormPageStyle that containe all properties to custom form page view

import 'package:flutter/material.dart';

class FormPageStyle {
  final Color? backgroundColor;
  final ButtonStyle? buttonStyle;
  final double? buttonHeight;
  final double? buttonWidth;
  final TextStyle? buttonTextStyle;
  final bool? appBarCenterTitle;
  final double? appBarElevation;
  final Color? appBarBackgroundColor;
  final double? appBarHeight;
  final TextStyle? appBarTextStyle;
  final Color? progressIndicatorColor;
  final Color? progressIndicatorBackgroundColor;
  final double? progressIndicatorSize;
  final double? progressIndicatorStrokeWidth;
  final Icon? backButtonIcon;

  const FormPageStyle({
    this.backgroundColor,
    this.buttonStyle,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonTextStyle,
    this.appBarCenterTitle,
    this.appBarElevation,
    this.appBarBackgroundColor,
    this.appBarHeight,
    this.progressIndicatorColor,
    this.progressIndicatorBackgroundColor,
    this.appBarTextStyle,
    this.progressIndicatorSize,
    this.progressIndicatorStrokeWidth,
    this.backButtonIcon,
  });
}
