import 'package:flutter/material.dart';

/// Represents a page model for the form.
class FormPageModel {
  /// The title of the page.
  final String? title;

  /// The form widget for this page.
  final Widget form;

  /// The text displayed on the button for this page.
  final String? textButton;

  /// The value indicating whether the button is enabled.
  final bool? isButtonEnabled;

  /// The callback function executed when the button is pressed.
  final VoidCallback? onPressed;

  /// The style applied to the button.
  final ButtonStyle? buttonStyle;

  /// The key for the form.
  final GlobalKey<FormState>? formKey;

  /// Creates a new instance of [FormPageModel].
  ///
  /// [title] (optional) - The title of the page.
  /// [form] (required) - The form widget for this page.
  /// [textButton] (optional) - The text displayed on the button for this page.
  /// [onPressed] (optional) - The callback function executed when the button is pressed.
  /// [buttonStyle] (optional) - The style applied to the button.
  /// [formKey] (optional) - The key for the form.
  FormPageModel({
    this.title,
    required this.form,
    this.textButton,
    this.onPressed,
    this.buttonStyle,
    this.formKey,
    this.isButtonEnabled,
  });
}
