import 'package:ciam_lab/Utils/colorsandstyles.dart';
import 'package:ciam_lab/widgets/commonAppBarLeading.dart';
import 'package:ciam_lab/widgets/common_button.dart';
import 'package:ciam_lab/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/common_app_bar_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: commonAppBarTitle(),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (context) => commonAppBarLeading(
                iconData: Icons.menu,
                onPressed: () {
                  setState(() {
                    Scaffold.of(context).openDrawer();
                  });
                }),
          )),
      drawer: commonDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Revenue',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: appblueColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                  )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Net Worth'),
                            Text(
                              '₹ ',
                              style: GoogleFonts.montserrat(
                                  color: appblueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: commonBtn(
                height: 40,
                borderRadius: 10,
                s: 'Lab Request',
                bgcolor: appblueColor,
                textColor: Colors.white,
                onPressed: () {}),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.white,
            child: TabBar(
              labelPadding: EdgeInsets.only(right: 4, left: 0),
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2.0, color: appblueColor),
                  insets: EdgeInsets.all(-1)),
              controller: _tabController,
              labelColor: appblueColor,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Completed',
                ),
                Tab(
                  text: 'Upcoming',
                ),
                // Tab(
                //   text: 'Lifestyle',
                // ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 0,
            color: Colors.grey.withOpacity(0.5),
          ),
          SizedBox(
            height: 10,
          ),
          // tab bar view here
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    child: Center(
                        child: Text(
                      '30',
                      style: GoogleFonts.montserrat(
                          color: appblueColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    child: Center(
                        child: Text(
                      '15',
                      style: GoogleFonts.montserrat(
                          color: appblueColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                // Lifestyle()
                // second tab bar view widget
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: commonBtn(
                height: 40,
                borderRadius: 10,
                s: 'Reviews',
                bgcolor: appblueColor,
                textColor: Colors.white,
                onPressed: () {}),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: CircleAvatar(),
                              title: Text('docName'),
                              subtitle: RatingBarIndicator(
                                rating: 4.0,
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
                              'lorem ipsum',
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
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Wrap(children: [
              commonBtn(
                s: 'View All',
                bgcolor: appblueColor,
                textColor: Colors.white,
                onPressed: () {
                  // Push(context, MyReviewRatingsScreen());
                },
                height: 30,
                width: 90,
                textSize: 11,
                borderRadius: 4,
              ),
            ]),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
