import 'dart:io';

import 'package:ciam_lab/API%20repo/local_auth_api.dart';
import 'package:ciam_lab/Utils/colorsandstyles.dart';
import 'package:ciam_lab/controller/navigation_controller.dart';
import 'package:ciam_lab/views/home_screen.dart';
import 'package:ciam_lab/widgets/commonAppBarLeading.dart';
import 'package:ciam_lab/widgets/common_app_bar_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class BiometricAuthenticate extends StatefulWidget {
  const BiometricAuthenticate({Key? key}) : super(key: key);

  @override
  _BiometricAuthenticateState createState() => _BiometricAuthenticateState();
}

class _BiometricAuthenticateState extends State<BiometricAuthenticate> {
  @override
  void initState() {
    // FirebaseNotificationHandling().setupFirebase(context);
    // setupFirebase(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: commonAppBarLeading(
            iconData: Icons.arrow_back_ios_new,
            onPressed: () {
              Pop(context);
            }),
        title: commonAppBarTitle(),
        centerTitle: true,
        backgroundColor: appAppBarColor,
        elevation: 0,
      ),
      body: GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            final isAuthenticated = await LocalAuthApi.authenticate(context);
            if (isAuthenticated) {
              prefs.setString('isbiometric', 'yes');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            } else {}
          },
          child: (Platform.isAndroid)
              ? Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                              'assets/pngs/Icon ionic-md-finger-print.png',
                              height: 90),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Press This FingerPrint to Start Scanning',
                            style: GoogleFonts.montserrat(
                                color: apptealColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: navbarht + 20),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(005.0),
                                    side: BorderSide(color: apptealColor))),
                            // backgroundColor: MaterialStateProperty.all(
                            //     apptealColor.withOpacity(0.2))
                          ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('isbiometric', 'no');
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.montserrat(
                                color: appblueColor, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/pngs/Icon material-face.png',
                              height: 90),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Press This Face to Start Scanning FaceID',
                            style: GoogleFonts.montserrat(
                                color: apptealColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(005.0),
                                    side: BorderSide(color: apptealColor))),
                            // backgroundColor: MaterialStateProperty.all(
                            //     apptealColor.withOpacity(0.2))
                          ),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('isbiometric', 'no');
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => GeneralScreen()));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            'Skip',
                            style: GoogleFonts.montserrat(
                                color: appblueColor, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
    );
  }
}
