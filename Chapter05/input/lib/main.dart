import 'package:flutter/material.dart';
import 'package:input/verification_code_input_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CustomInputStateExamplesWidget(),
    );
  }
}

/// Using the custom VerificationCodeInput in a Form
class CustomInputStateExamplesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                VerificationCodeFormField(
                  validator: (String? value) {
                    if (value!.isEmpty) return "cannot be empty";
                    if (value.length < 6) return "You must inform all 6 digits";

                    return null;
                  },
                ),
                Builder(
                  builder: (BuildContext context) => ElevatedButton(
                    onPressed: () {
                      print("Running validation");
                      final valid = Form.of(context)?.validate();
                      print("valid: $valid");
                    },
                    child: Text("validate"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
