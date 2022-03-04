import 'package:ciam_lab/views/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:ciam_lab/API%20repo/api_constants.dart';

import 'navigation_controller.dart';

class SignUpController {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email_Id = TextEditingController();
  TextEditingController mobile_number = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  String countrycode = '+91';

  void clearControllers() {
    firstname.clear();
    lastname.clear();
    email_Id.clear();
    mobile_number.clear();
    password.clear();
    confirmpassword.clear();
  }

  void Signup(BuildContext context) {
    PostData(PARAM_URL: 'signup.php', params: {
      'token': Token,
      'first_name': firstname.text,
      'last_name': lastname.text,
      'email': email_Id.text,
      'country_code': countrycode,
      'mobile_no': mobile_number.text,
      'password': password.text,
      'confirm_password': confirmpassword.text,
    }).then((value) {
      (value['status'])
          ? Push(context, SignInScreen())
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(value['message']),
              duration: Duration(seconds: 1),
            ));
    });
  }
}
