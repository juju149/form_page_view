// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:form_page_view/enum/progress_enum.dart';
import 'package:form_page_view/models/form_page_model.dart';
import 'package:form_page_view/form_page_view.dart';
import 'package:form_page_view/models/form_page_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Forms keys
    final GlobalKey<FormState> formKeyPage1 = GlobalKey<FormState>();
    final GlobalKey<FormState> formKeyPage2 = GlobalKey<FormState>();
    final GlobalKey<FormState> formKeyPage3 = GlobalKey<FormState>();

    // Controllers
    final emailController = TextEditingController();
    final usernameController = TextEditingController();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();

    // Create a list of FormPageModel objects representing the form pages
    final pages = [
      FormPageModel(
        formKey: formKeyPage1,
        title: 'Page 1',
        textButton: 'Next',
        body: Form(
          key: formKeyPage1,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              )
            ],
          ),
        ),
      ),
      FormPageModel(
        formKey: formKeyPage2,
        title: 'Page 2',
        textButton: 'Next',
        body: Form(
          key: formKeyPage2,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      FormPageModel(
        formKey: formKeyPage3,
        title: 'Page 3',
        textButton: 'Next',
        body: Form(
          key: formKeyPage3,
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    ];

    const style = FormPageStyle(
      backgroundColor: Colors.white,
      buttonHeight: 60,
    );

    return FormPageView(
      controller: PageController(),
      progress: ProgressIndicatorType.circular,
      pages: pages,
      style: style,
      onFormSubmitted: () {
        // print all the values
        print('Username: ${usernameController.text}');
        print('First Name: ${firstNameController.text}');
        print('Last Name: ${lastNameController.text}');
        print('Email: ${emailController.text}');
      },
    );
  }
}
