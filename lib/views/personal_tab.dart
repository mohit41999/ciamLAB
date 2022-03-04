import 'dart:convert';
import 'dart:io';

import 'package:ciam_lab/Utils/colorsandstyles.dart';
import 'package:ciam_lab/controller/navigation_controller.dart';
import 'package:ciam_lab/widgets/commonAppBarLeading.dart';
import 'package:ciam_lab/widgets/common_app_bar_title.dart';
import 'package:ciam_lab/widgets/common_button.dart';
import 'package:ciam_lab/widgets/title_enter_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Personal extends StatefulWidget {
  const Personal({Key? key}) : super(key: key);

  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Profile Setting',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, color: apptealColor),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => commonAppBarLeading(
                iconData: Icons.arrow_back_ios_new,
                onPressed: () {
                  setState(() {
                    Pop(context);
                  });
                }),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TitleEnterField('Firstname', 'Firstname', controller),
            TitleEnterField('Lastname', 'Lastname', controller),
            TitleEnterField('Email ID', 'email ID', controller),
            TitleEnterField('Contact Number', 'Contact Number', controller),
            TitleEnterField(
              'Address',
              'Address',
              controller,
              maxLines: 10,
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: commonBtn(
                s: 'Submit',
                bgcolor: appblueColor,
                textColor: Colors.white,
                onPressed: () {},
                borderRadius: 8,
                textSize: 20,
              ),
            ),
            SizedBox(height: navbarht + 20),
          ],
        ),
      ),
    );
  }

  Future<void> _showPicker(context) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        setState(() {
                          _imgFromGallery();
                        });

                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      setState(() {
                        _imgFromCamera();
                      });

                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _imgFromCamera() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {});
  }

  Future _imgFromGallery() async {
    var image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {});
  }
}
