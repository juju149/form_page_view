# Pageview Form

Pageview Form is a Flutter package that allows you to create a form with a page view and a progress bar. This package makes it easy to create interactive and customizable forms with seamless navigation between pages.

## Demo

![Example screenshot](assets/Screenrecorder-2023-05-20-22-02-55-536.mp4)
![Example screenshot](assets/Screenrecorder-2023-05-20-22-03-32-538.mp4)

Circular indicator:
![Example screenshot](assets/Screenshot_2023-05-20-22-05-03-030_com.example.pageview_form_test.jpg)

Linear indicator:
![Example screenshot](assets/Screenshot_2023-05-20-22-05-10-030_com.example.pageview_form_test.jpg)

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  pageview_form: ^1.0.0
```

Import the package in your Dart file:

```dart
import 'package:pageview_form/pageview_form.dart';
```

## Usage

Create a list of page models (**'PageFormModel'**) to define the pages in your form. Each page model should contain a **'formKey'** for form validation and a **'form'** that represents the page content.

```dart
final List<PageFormModel> pages = [
  PageFormModel(
    formKey: GlobalKey<FormState>(),
    form: YourFormWidget(),
    title: 'Page 1',
    textButton: 'Next',
  ),
  // Add other page models here
];
```

Next, create a **PageController** to control the navigation between pages:

```dart
final PageController _pageController = PageController();
```

Use the **'PageviewForm'** widget by providing it with the pages, the function to execute when the form is submitted, and other optional parameters to customize the appearance and behavior of the form:

```dart
PageviewForm(
  progress: ProgressIndicatorType.linear,
  pages: pages,
  onFormSubmitted: () {
    // Function to execute when the form is submitted
  },
  controller: _pageController,
),
```

Refer to the provided usage **'examples'** in the example folder for more details.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| progress | ProgressIndicatorType? | Optional. Specifies the type of progress indicator to use. Default is `ProgressIndicatorType.linear`. |
| pages | List\<PageModel> | Required. The list of page models that define the pages in the form. |
| onFormSubmitted | Function() | Required. The function to execute when the form is submitted. |
| padding | EdgeInsetsGeometry? | Optional. The padding around the form widget. |
| backgroundColor | Color? | Optional. The background color of the form widget. |
| buttonStyle | ButtonStyle? | Optional. The style of the button widget. |
| buttonHeight | double? | Optional. The height of the button widget. Default is `50`. |
| buttonWidth | double? | Optional. The width of the button widget. Default is `double.infinity`. |
| buttonTextStyle | TextStyle? | Optional. The text style of the button widget. |
| showAppBar | bool? | Optional. Specifies whether to show the app bar. Default is `true`. |
| showBackButton | bool? | Optional. Specifies whether to show the back button on the app bar. Default is `true`. |
| appBarCenterTitle | bool? | Optional. Specifies whether to center the title on the app bar. Default is `false`. |
| appBarElevation | double? | Optional. The elevation of the app bar. Default is `4`. |
| appBarbackgroundColor | Color? | Optional. The background color of the app bar. Default is `Colors.white`. |
| appBarheight | double? | Optional. The height of the app bar. Default is `56`. |
| progressIndicatorColor | Color? | Optional. The color of the progress indicator. If not specified, it uses the primary color of the theme. |
| progressIndicatorBackgroundColor | Color? | Optional. The background color of the progress indicator. Default is `Colors.grey[300]`. |
| progressIndicatorSize | double? | Optional. The size of the progress indicator. Default is `40`. |
| progressIndicatorStrokeWidth | double? | Optional. The stroke width of the progress indicator. Default is `4`. |
| controller | PageController | Required. The page controller for controlling the navigation in the pages. |

## Authors

- [@juju149](https://www.github.com/juju149)

