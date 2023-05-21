// Importation des packages et des fichiers nécessaires pour le widget
library form_page_view;

import 'package:flutter/material.dart';
import 'package:form_page_view/enum/progress_enum.dart';
import 'package:form_page_view/models/form_page_model.dart';

// Définition du widget FormPageView
class FormPageView extends StatefulWidget {
  // Paramètres optionnels pour personnaliser l'apparence et le comportement du formulaire
  final ProgressIndicatorType? progress;
  final List<PageFormModel> pages;
  final Function() onFormSubmitted;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final ButtonStyle? buttonStyle;
  final double? buttonHeight;
  final double? buttonWidth;
  final TextStyle? buttonTextStyle;
  final bool? showAppBar;
  final bool? showBackButton;
  final bool? appBarCenterTitle;
  final double? appBarElevation;
  final Color? appBarBackgroundColor;
  final double? appBarHeight;
  final TextStyle? appBarTextStyle;
  final Color? progressIndicatorColor;
  final Color? progressIndicatorBackgroundColor;
  final double? progressIndicatorSize;
  final double? progressIndicatorStrokeWidth;
  final PageController controller;

  const FormPageView({
    Key? key,
    this.progress = ProgressIndicatorType.linear,
    required this.pages,
    required this.onFormSubmitted,
    this.padding,
    this.buttonStyle,
    this.showAppBar = true,
    this.showBackButton = true,
    this.buttonHeight = 50,
    this.buttonWidth = double.infinity,
    this.buttonTextStyle,
    this.appBarCenterTitle = false,
    this.appBarElevation = 4,
    this.appBarBackgroundColor = Colors.white,
    this.appBarHeight = 56,
    this.progressIndicatorColor,
    this.progressIndicatorBackgroundColor,
    this.appBarTextStyle,
    this.progressIndicatorSize,
    this.progressIndicatorStrokeWidth,
    this.backgroundColor,
    required this.controller,
  }) : super(key: key);

  @override
  _FormPageViewState createState() => _FormPageViewState();
}

// Définition de l'état du widget FormPageView
class _FormPageViewState extends State<FormPageView> {
  // Index de la page actuelle
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Suppression du contrôleur de page
    widget.controller.dispose();
    super.dispose();
  }

  // Validation de la page actuelle
  bool _validateCurrentPage() {
    final page = widget.pages[_currentPageIndex];
    if (page.formKey != null) {
      final form = page.formKey!.currentState!;
      if (form.validate()) {
        form.save();
      } else {
        return false;
      }
    }
    return true;
  }

  // Passage à la page suivante
  void _onNextPressed() {
    if (_validateCurrentPage()) {
      setState(() {
        if (_currentPageIndex < widget.pages.length - 1) {
          _currentPageIndex++;
          widget.controller.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        } else {
          widget.onFormSubmitted();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Construction de l'interface utilisateur du widget
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Colors.white,
      appBar: widget.showAppBar!
          ? AppBar(
              centerTitle: widget.appBarCenterTitle ?? false,
              elevation: widget.appBarElevation ?? 4,
              backgroundColor: widget.appBarBackgroundColor ?? Colors.white,
              toolbarHeight: widget.appBarHeight ?? 56,
              leading: widget.showBackButton!
                  ? IconButton(
                      onPressed: () {
                        if (_currentPageIndex > 0) {
                          setState(() {
                            _currentPageIndex--;
                            widget.controller.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    )
                  : null,
              title: widget.pages[_currentPageIndex].title != null
                  ? Text(
                      widget.pages[_currentPageIndex].title!,
                      style: widget.appBarTextStyle ??
                          const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  : null,
              actions: [
                // Indicateur de progression circulaire ou linéaire
                widget.progress == ProgressIndicatorType.circular
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0,
                            end: _currentPageIndex / (widget.pages.length - 1),
                          ),
                          duration: const Duration(milliseconds: 300),
                          builder: (context, value, child) {
                            return SizedBox(
                              width: widget.progressIndicatorSize ?? 40,
                              height: widget.progressIndicatorSize ?? 40,
                              child: CircularProgressIndicator(
                                value: value,
                                strokeWidth:
                                    widget.progressIndicatorStrokeWidth ?? 4,
                                color: widget.progressIndicatorColor ??
                                    Theme.of(context).primaryColor,
                                backgroundColor:
                                    widget.progressIndicatorBackgroundColor,
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            )
          : null,
      body: Padding(
        padding: widget.padding ?? const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Indicateur de progression linéaire ou rien
            widget.progress == ProgressIndicatorType.linear
                ? TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 0,
                      end: _currentPageIndex / (widget.pages.length - 1),
                    ),
                    duration: const Duration(milliseconds: 300),
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        minHeight: widget.progressIndicatorStrokeWidth ?? 4,
                        color: widget.progressIndicatorColor ??
                            Theme.of(context).primaryColor,
                        backgroundColor:
                            widget.progressIndicatorBackgroundColor ??
                                Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          widget.progressIndicatorColor ??
                              Theme.of(context).primaryColor,
                        ),
                      );
                    },
                  )
                : const SizedBox(
                    height: 0,
                  ),
            // PageView pour afficher les pages du formulaire
            Expanded(
              child: PageView.builder(
                controller: widget.controller,
                itemCount: widget.pages.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return widget.pages[index].form;
                },
              ),
            ),
            // Bouton pour passer à la page suivante
            SizedBox(
              height: widget.buttonHeight ?? 50,
              width: widget.buttonWidth ?? double.infinity,
              child: ElevatedButton(
                onPressed: _onNextPressed,
                child: Text(
                  widget.pages[_currentPageIndex].textButton ?? 'Next',
                  style: widget.buttonTextStyle ??
                      TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                ),
                style: widget.buttonStyle ??
                    ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
