import 'package:ecommerce/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/constants.dart';
import '../../../size_config.dart';
import '../../../components/custom_suffix_icons.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) {
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
                } else if (!emailRegExp.hasMatch(value) &&
                    !errors.contains(EMAIL_INVALID_ERROR)) {
                  setState(() {
                    message = EMAIL_INVALID_ERROR;
                    errors.add(message);
                  });
                }
                return null;
              },
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Email',
                hintText: 'Enter your email',
                suffixIcon: CustomSuffixIcon(
                  image: "assets/icons/Mail.svg",
                ),
              ),
            ),
            SizedBox(
              height: getProportionateHeight(20),
            ),
            TextFormField(
              onChanged: (value) {
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
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Password',
                hintText: 'Enter your password',
                suffixIcon: CustomSuffixIcon(
                  image: "assets/icons/Lock.svg",
                ),
              ),
            ),
            SizedBox(
              height: getProportionateHeight(20),
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateHeight(10),),
            Row(
              children: [
                Checkbox(value: isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = value;
                      });
                    }),
                Text('Remember me'),
                Spacer(),
                Text('Forgot password'),
              ],
            ),
            SizedBox(height: getProportionateHeight(40),),
            DefaultButton(
              text: 'Continue',
              press: () {
                if (_formKey.currentState.validate())
                  _formKey.currentState.save();
              },
            )
          ],
        ));
  }
}

class FormError extends StatelessWidget {
  final List<String> errors;

  FormError({@required this.errors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => generateError(error: errors[index])),
    );
  }

  Row generateError({error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          height: getProportionateHeight(18),
        ),
        SizedBox(
          height: getProportionateHeight(18),
          width: getProportionateWidth(10),
        ),
        Text(
          error,
          style:
              TextStyle(color: Colors.red, fontSize: getProportionateWidth(15)),
        )
      ],
    );
  }
}
