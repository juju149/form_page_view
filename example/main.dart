// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:form_page_view/enum/progress_enum.dart';
import 'package:form_page_view/models/form_page_model.dart';
import 'package:form_page_view/form_page_view.dart';

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

GlobalKey<FormState> formKeyPage1 = GlobalKey<FormState>();
GlobalKey<FormState> formKeyPage2 = GlobalKey<FormState>();
GlobalKey<FormState> formKeyPage3 = GlobalKey<FormState>();
GlobalKey<FormState> formKeyPage4 = GlobalKey<FormState>();

// Field keys
const usernameKey = Key('username');
const firstNameKey = Key('firstName');
const lastNameKey = Key('lastName');
const emailKey = Key('email');
const passwordKey = Key('password');
const confirmPasswordKey = Key('confirmPassword');

// Controllers
final passwordController = TextEditingController();
final confirmPasswordController = TextEditingController();
final emailController = TextEditingController();
final usernameController = TextEditingController();
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Create a list of FormPageModel objects representing the form pages
  final pages = [
    FormPageModel(
      formKey: formKeyPage1,
      title: 'Page 1',
      textButton: 'Next',
      form: Form(
        key: formKeyPage1,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              key: usernameKey,
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
      form: Form(
        key: formKeyPage2,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              key: firstNameKey,
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
              key: lastNameKey,
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
      form: Form(
        key: formKeyPage3,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              key: emailKey,
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
    FormPageModel(
      formKey: formKeyPage4,
      title: 'Page 4',
      textButton: 'Submit',
      form: Form(
        key: formKeyPage4,
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextFormField(
              key: passwordKey,
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              key: confirmPasswordKey,
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FormPageView(
      controller: PageController(),
      backgroundColor: const Color(0xFFF3F4F9),
      progress: ProgressIndicatorType.circular,
      pages: pages,
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
