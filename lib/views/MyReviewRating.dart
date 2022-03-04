import 'package:ciam_lab/Utils/colorsandstyles.dart';
import 'package:ciam_lab/widgets/commonAppBarLeading.dart';
import 'package:ciam_lab/widgets/common_app_bar_title.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyReviewRatingsScreen extends StatefulWidget {
  const MyReviewRatingsScreen({Key? key}) : super(key: key);

  @override
  _MyReviewRatingsScreenState createState() => _MyReviewRatingsScreenState();
}

class _MyReviewRatingsScreenState extends State<MyReviewRatingsScreen> {
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
          title: commonAppBarTitleText(appbarText: 'My Reviews'),
          backgroundColor: appAppBarColor,
          elevation: 0,
          leading: Builder(
              builder: (context) => commonAppBarLeading(
                  iconData: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ),
        body: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 8),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(),
                          title: Text('user Name'),
                          subtitle: RatingBarIndicator(
                            rating: 5,
                            itemCount: 5,
                            itemSize: 15.0,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                          trailing: Text(
                            '27/09/2022',
                            style: GoogleFonts.lato(
                                color: apptealColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'loremipsum',
                          style: GoogleFonts.lato(fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
