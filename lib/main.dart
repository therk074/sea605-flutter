import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Phatarisa Maneewan 67130700323';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onChanged: (text) {
              print('Name text field: $text (${text.characters.length})');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(hintText: 'Name'),
            controller: nameController,
          ),
          TextFormField(
            onChanged: (text) {
              print('Email text field: $text (${text.characters.length})');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              // developer.log(emailRegex.hasMatch(value).toString(), name: 'email');
              if (!emailRegex.hasMatch(value)) {
                return 'Please enter valid Email address';
              }
              return null;
            },
            decoration: InputDecoration(hintText: 'Email'),
            controller: emailController,
          ),
          TextFormField(
            onChanged: (text) {
              print('Password text field: $text (${text.characters.length})');
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              if (value.length < 6) {
                return 'Please enter password at least 6 characters';
              }
              return null;
            },
            decoration: InputDecoration(hintText: 'Password'),
            obscureText: true,
            controller: passwordController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name:${nameController.text}'),
                            Text('Email:${emailController.text}'),
                            Text('Password:${passwordController.text}'),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
