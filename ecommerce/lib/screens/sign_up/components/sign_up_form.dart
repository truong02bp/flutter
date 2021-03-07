import 'package:ecommerce/components/custom_suffix_icons.dart';
import 'package:ecommerce/components/default_button.dart';
import 'package:ecommerce/components/form_error.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email,password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateHeight(25),
          ),
          TextFormField(
            onChanged: (value) {
              email = value;
              if (value.isNotEmpty && errors.contains(EMPTY_EMAIL_ERROR)) {
                setState(() {
                  errors.remove(EMPTY_EMAIL_ERROR);
                });
              }
              if (emailRegExp.hasMatch(value) &&
                  errors.contains(EMAIL_INVALID_ERROR)) {
                setState(() {
                  errors.remove(EMAIL_INVALID_ERROR);
                });
              }
            },
            validator: (value) {
              String message = "";
              if (value.isEmpty) {
                message = EMPTY_EMAIL_ERROR;
                if (!errors.contains(message)) {
                  setState(() {
                    if (errors.contains(EMAIL_INVALID_ERROR))
                      errors.remove(EMAIL_INVALID_ERROR);
                    errors.add(message);
                  });
                }
                return "";
              } else if (!emailRegExp.hasMatch(value)) {
                if (!errors.contains(EMAIL_INVALID_ERROR))
                  setState(() {
                    message = EMAIL_INVALID_ERROR;
                    errors.add(message);
                  });
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Enter your email',
                labelText: 'Email',
                suffixIcon: CustomSuffixIcon(image :'assets/icons/Mail.svg')),
          ),
          SizedBox(
            height: getProportionateWidth(25),
          ),
          TextFormField(
            obscureText: true,
            onChanged: (value) {
              password = value;
              if (value.isNotEmpty && errors.contains(EMPTY_PASSWORD_ERROR)) {
                setState(() {
                  errors.remove(EMPTY_PASSWORD_ERROR);
                });
              }
            },
            validator: (value) {
              String message = "";
              if (value.isEmpty) {
                message = EMPTY_PASSWORD_ERROR;
                if (!errors.contains(message))
                  setState(() {
                    errors.add(message);
                  });
                return "";
              }
              return null;
            },
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Enter your password',
                labelText: 'Password',
                suffixIcon: CustomSuffixIcon(
                  image: 'assets/icons/Lock.svg',
                )),
          ),
          SizedBox(
            height: getProportionateWidth(25),
          ),
          TextFormField(
            validator: (value){
              if (value != password){
                if (!errors.contains(CONFIRM_PASSWORD_ERROR))
                  setState(() {
                    errors.add(CONFIRM_PASSWORD_ERROR);
                  });
                return "";
              }
              return null;
            },
            onChanged: (value){
              if (errors.contains(CONFIRM_PASSWORD_ERROR))
                setState(() {
                  errors.remove(CONFIRM_PASSWORD_ERROR);
                });
            },
            obscureText: true,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Confirm your password',
                labelText: 'Confirm password',
                suffixIcon: CustomSuffixIcon(
                  image: 'assets/icons/Lock.svg',
                )),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateHeight(25),
          ),
          DefaultButton(text: 'Continue', press: (){
            if (_formKey.currentState.validate())
              _formKey.currentState.save();
          })
        ],
      ),
    ));
  }
}
