# Pageview Form

Pageview Form is a Flutter package that allows you to create a form with a page view and a progress bar. This package makes it easy to create interactive and customizable forms with seamless navigation between pages.

## Demo

| Circular indicator | Linear indicator |
|-------|---|
| ![Example screenshot](assets/Screenshot_2023-05-20-22-05-03-030_com.example.form_page_view_test.jpg) | ![Example screenshot](assets/Screenshot_2023-05-20-22-04-51-028_com.example.form_page_view_test.jpg) |
| ![Example screenshot](assets/Screenrecorder-2023-05-20-22-02-55-536.gif) | ![Example screenshot](assets/Screenrecorder-2023-05-20-22-03-32-538.gif) |


## Platforms supported

| Android | iOS | Web | MacOS | Windows | Linux |
|:-------:|:---:|:---:|:-----:|:-------:|:-----:|
|✅|✅|✅|✅|✅|✅|

## Features

- Create a form with a page view and a progress bar
- Navigate between pages using the progress bar or the back button
- Customize the appearance of the form
- Customize the progress indicator
- Customize the button widget

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  form_page_view: ^1.0.0
```

Import the package in your Dart file:

```dart
import 'package:form_page_view/form_page_view.dart';
```

## Usage

Create a list of page models (**'FormPageModel'**) to define the pages in your form. Each page model should contain a **'formKey'** for form validation and a **'form'** that represents the page content.

```dart
final List<FormPageModel> pages = [
  FormPageModel(
    formKey: GlobalKey<FormState>(),
    body: YourFormWidget(),
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

Use the **'FormPageView'** widget by providing it with the pages, the function to execute when the form is submitted, and other optional parameters to customize the appearance and behavior of the form:

```dart
FormPageView(
  progress: ProgressIndicatorType.linear,
  pages: pages,
  onFormSubmitted: () {
    // Function to execute when the form is submitted
  },
  controller: _pageController,
),
```

Refer to the provided usage **'examples'** in the example folder for more details.

## Properties

| Property | Type | Description |
|-----------|------|-------------|
| progress | ProgressIndicatorType? | Optional. Specifies the type of progress indicator to use. Default is `ProgressIndicatorType.linear`. |
| pages | List\<PageModel> | Required. The list of page models that define the pages in the form. |
| onFormSubmitted | Function() | Required. The function to execute when the form is submitted. |
| controller | PageController | Required. The page controller for controlling the navigation in the pages. |
| contentPadding | EdgeInsetsGeometry? | Optional. The padding of the content of the form pages. Default is `EdgeInsets.all(16)`. |
| buttonPadding | EdgeInsetsGeometry? | Optional. The padding of the page navigation button. Default is `EdgeInsets.all(16)`. |
| progressPadding | EdgeInsetsGeometry? | Optional. The padding of the progress indicator. Default is `EdgeInsets.all(8.0)`. |
| style | FormPageStyle? | Optional. A FormPageStyle object to customize the appearance and behavior of the form. |

## Customization

### Form widget

You can customize the form widget by providing the following parameters:

- **'contentPadding'**: The padding of the content of the form pages. Default is `EdgeInsets.all(16)`.
- **'buttonPadding'**: The padding of the page navigation button. Default is `EdgeInsets.all(16)`.
- **'progressPadding'**: The padding of the progress indicator. Default is `EdgeInsets.all(8.0)`.
- **'style'**: A **FormPageStyle** object to customize the appearance and behavior of the form.

### Form Page Style

You can customize the form page style by providing a **'FormPageStyle'** object to the **'style'** parameter. The following parameters are available:

- **'backgroundColor'**: The background color of the form pages. Default is `Colors.white`.

#### App bar

You can customize the app bar by providing the following parameters:

- **'appBarCenterTitle'**: Specifies whether to center the title on the app bar. Default is `false`.
- **'appBarElevation'**: The elevation of the app bar. Default is `4.0`.
- **'appBarBackgroundColor'**: The background color of the app bar. Default is `Colors.white`.
- **'appBarHeight'**: The height of the app bar. Default is `56.0`.
- **'appBarTextStyle'**: The text style of the app bar title. Default is `TextStyle(color: Colors.black)`.

#### Progress indicator

You can customize the progress indicator by providing the following parameters:

- **'progressIndicatorColor'**: The color of the progress indicator. Default is `Colors.blue`.
- **'progressIndicatorBackgroundColor'**: The background color of the progress indicator. Default is `Colors.grey`.
- **'progressIndicatorSize'**: The size of the progress indicator. Default is `48.0`.
- **'progressIndicatorStrokeWidth'**: The stroke width of the progress indicator. Default is `4.0`.

#### Button widget

You can customize the button widget by providing the following parameters:

- **'buttonStyle'**: The style of the page navigation button. Default is `ElevatedButton.styleFrom(primary: Colors.blue)`.
- **'buttonHeight'**: The height of the page navigation button. Default is `48`.
- **'buttonWidth'**: The width of the page navigation button. Default is `double.infinity`.
- **'buttonTextStyle'**: The text style of the page navigation button. Default is `TextStyle(color: Colors.white)`.
- **'backButtonIcon'**: The icon of the back button. Default is `Icons.arrow_back`.

## Authors

- [@juju149](https://www.github.com/juju149)