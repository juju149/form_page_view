// Create a class FormPageStyle that containe all properties to custom form page view
import 'package:flutter/material.dart';

class FormPageStyle {
  // Background color of the form page view
  final Color? backgroundColor;

  // Style of the submit button
  final ButtonStyle? buttonStyle;

  // Height of the submit button
  final double? buttonHeight;

  // Width of the submit button
  final double? buttonWidth;

  // Text style of the submit button
  final TextStyle? buttonTextStyle;

  // Whether the app bar title should be centered
  final bool? appBarCenterTitle;

  // Elevation of the app bar
  final double? appBarElevation;

  // Background color of the app bar
  final Color? appBarBackgroundColor;

  // Height of the app bar
  final double? appBarHeight;

  // Text style of the app bar title
  final TextStyle? appBarTextStyle;

  // Color of the progress indicator
  final Color? progressIndicatorColor;

  // Background color of the progress indicator
  final Color? progressIndicatorBackgroundColor;

  // Size of the progress indicator
  final double? progressIndicatorSize;

  // Stroke width of the progress indicator
  final double? progressIndicatorStrokeWidth;

  // Icon of the back button
  final Icon? backButtonIcon;

  // Constructor for the FormPageStyle class
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
