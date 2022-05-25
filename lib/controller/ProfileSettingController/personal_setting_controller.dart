import 'package:ciam_lab/API%20repo/end_points.dart';
import 'package:ciam_lab/model/lab_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../API repo/api_constants.dart';
import '../../Utils/progress_view.dart';

class PersonalSettingController {
  // XFile? mediaFile = null;
  // String oldname = '';

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactno = TextEditingController();

  TextEditingController address = TextEditingController();

  // late String profileImage;
  //
  // List<Map> genderType = [
  //   {'type': 'Male', 'value': 'm'},
  //   {'type': 'Female', 'value': 'f'}
  // ];
  // var dropDownvalue;

  Future<void> submit(BuildContext context) async {
    var loader = ProgressView(context);
    loader.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    print(user_id.toString());

    Map<String, String> bodyParam = {
      'token': Token,
      'user_id': user_id.toString(),
      'first_name': firstname.text,
      'last_name': lastname.text,
      'email': email.text,
      'mobile_number': contactno.text,
      'address': address.text,
    };

    // var response = (mediaFile == null)
    //     ?
    var response = await PostData(
        PARAM_URL: AppConstants.profile_setting, params: bodyParam);
    // : await PostDataWithImage(
    //     PARAM_URL: 'update_patient_details.php',
    //     params: bodyParam,
    //     imagePath: mediaFile!.path,
    //     imageparamName: 'image');

    loader.dismiss();
    if (response['status']) {
      success(context, response);
    } else {
      failure(context, response);
    }
  }

  Future<GetProfile> getdata(BuildContext context) async {
    // var loader = ProgressView(context);
    // loader.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user_id = prefs.getString('user_id');
    print(user_id);
    var response =
        await PostData(PARAM_URL: AppConstants.get_user_profile, params: {
      'token': Token,
      'user_id': user_id.toString(),
    });
    print('-=========>>>>>' + response.toString());
    // loader.dismiss();
    return GetProfile.fromJson(response);
  }
}
