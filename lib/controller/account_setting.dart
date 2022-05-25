import 'package:ciam_lab/API%20repo/api_constants.dart';
import 'package:ciam_lab/API%20repo/end_points.dart';
import 'package:ciam_lab/Utils/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingController {
  TextEditingController old_password = TextEditingController();
  TextEditingController new_password = TextEditingController();

  Future<void> changePassword(BuildContext context) async {
    var loader = ProgressView(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loader.show();
    await PostData(PARAM_URL: AppConstants.account_setting, params: {
      'token': Token,
      'user_id': prefs.getString('user_id'),
      'old_password': old_password.text,
      'new_password': new_password.text,
    }).then((value) {
      loader.dismiss();
      (value['status'])
          ? success(context, value)
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(value['message']),
              duration: Duration(seconds: 1),
            ));
    });
  }

  Future<void> deactivateaccount(BuildContext context) async {
    var loader = ProgressView(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    loader.show();
    await PostData(PARAM_URL: AppConstants.deactive_account, params: {
      'token': Token,
      'user_id': prefs.getString('user_id'),
    }).then((value) {
      loader.dismiss();
      (value['status'])
          ? success(context, value)
          : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(value['message']),
              duration: Duration(seconds: 1),
            ));
    });
  }
}
