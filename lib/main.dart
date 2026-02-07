import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: MyCustomForm()));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState()=> _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formkey,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          TextFormField(
            keyboardType:TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(11)
            ],
            validator: (value) {
            if(value==null||value.isEmpty){
              return 'Please enter Something';
            }
            if(value.length != 11){
              return 'Please Enter valid Student ID';
            }
            return null;
          }
          ),
          Padding(padding:EdgeInsets.symmetric(vertical:16),
          child:ElevatedButton(onPressed:(){
            if(_formkey.currentState!.validate()){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Processing data')));
            }
          },child:Text('Submit')))
        ],
      ),
    );
  }
} 
