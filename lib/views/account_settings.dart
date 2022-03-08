import 'package:ciam_lab/controller/account_setting.dart';
import 'package:ciam_lab/controller/navigation_controller.dart';
import 'package:ciam_lab/views/biometric_authenticate.dart';
import 'package:ciam_lab/widgets/common_button.dart';
import 'package:ciam_lab/widgets/title_enter_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/colorsandstyles.dart';
import '../widgets/commonAppBarLeading.dart';
import '../widgets/common_app_bar_title.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  _AccountSettingState createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  AccountSettingController accountController = AccountSettingController();

  late bool value;
  Future initialize() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getString('isbiometric') == 'yes' ? true : false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: commonAppBarTitleText(appbarText: 'Account Setting'),
        backgroundColor: appAppBarColor,
        elevation: 0,
        leading: Builder(
            builder: (context) => commonAppBarLeading(
                iconData: Icons.arrow_back_ios_new,
                onPressed: () {
                  Navigator.pop(context);
                })),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              TitleEnterField('Enter Old Password', 'Change Password',
                  accountController.old_password),
              TitleEnterField('Enter New Password', 'New Password',
                  accountController.new_password),
              TextButton(
                  onPressed: () {
                    accountController.deactivateaccount(context);
                  },
                  child: Text(
                    'Deactivate Account',
                    style: GoogleFonts.montserrat(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Biometrics'),
                    CupertinoSwitch(
                        value: value,
                        onChanged: (result) async {
                          if (result) {
                            Push(context, BiometricAuthenticate());
                            setState(() {
                              value = result;
                            });
                          } else {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('isbiometric', 'no');
                            setState(() {
                              value = result;
                            });
                          }
                        })
                  ],
                ),
              ),
              SizedBox(
                height: navbarht + 20,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.only(bottom: navbarht + 20, left: 10, right: 10),
              child: commonBtn(
                s: 'Submit  ',
                bgcolor: appblueColor,
                textColor: Colors.white,
                onPressed: () {
                  accountController.changePassword(context);
                },
                borderRadius: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
