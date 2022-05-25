import 'package:ciam_lab/API%20repo/api_constants.dart';
import 'package:ciam_lab/API%20repo/end_points.dart';
import 'package:ciam_lab/Utils/progress_view.dart';
import 'package:ciam_lab/controller/navigation_controller.dart';
import 'package:ciam_lab/firebase/fcm.dart';
import 'package:ciam_lab/views/biometric_authenticate.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignInController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void clearControllers() {
    email.clear();

    password.clear();
  }

  login(BuildContext context, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_id', value['data']['id']);
    // FireBaseSetup().storefcmToken();
    print(prefs.getString('user_id'));

    PushReplacement(context, BiometricAuthenticate());
  }

  Future<void> SignIn(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();
    var response = await PostData(PARAM_URL: AppConstants.login, params: {
      'token': Token,
      'email': email.text,
      'password': password.text,
    });
    loader.dismiss();
    if (response['status']) {
      login(context, response);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['message']),
        duration: Duration(seconds: 1),
      ));
    }
  }
}
