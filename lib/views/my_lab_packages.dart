import 'package:ciam_lab/API%20repo/api_constants.dart';
import 'package:ciam_lab/API%20repo/end_points.dart';
import 'package:ciam_lab/Utils/colorsandstyles.dart';
import 'package:ciam_lab/controller/navigation_controller.dart';
import 'package:ciam_lab/model/lab_packages.dart';
import 'package:ciam_lab/widgets/commonAppBarLeading.dart';
import 'package:ciam_lab/widgets/common_app_bar_title.dart';
import 'package:ciam_lab/widgets/common_button.dart';
import 'package:ciam_lab/widgets/title_column.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLabPackages extends StatefulWidget {
  const MyLabPackages({Key? key}) : super(key: key);

  @override
  _MyLabPackagesState createState() => _MyLabPackagesState();
}

class _MyLabPackagesState extends State<MyLabPackages>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          Container(
            height: 50,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: TabBar(
                labelPadding: EdgeInsets.only(right: 4, left: 0),
                labelStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 34.0, color: appblueColor),
                    insets: EdgeInsets.all(8)),
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Upcoming',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                  // Tab(
                  //   text: 'Lifestyle',
                  // ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Upcoming(),
                Completed()

                // Lifestyle()
                // second tab bar view widget
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Upcoming extends StatefulWidget {
  const Upcoming({
    Key? key,
  }) : super(key: key);

  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  late LabPackageModel labPackages;
  bool loading = true;

  Future<LabPackageModel> getLabPackages() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var response = await PostData(
        PARAM_URL: AppConstants.get_upcoming_lab_package,
        params: {'token': Token, 'user_id': preferences.getString('user_id')});
    return LabPackageModel.fromJson(response);
  }

  @override
  void initState() {
    // TODO: implement initState

    getLabPackages().then((value) {
      labPackages = value;
      loading = false;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // (upcomingloading)
        //   ? Center(
        //       child: CircularProgressIndicator(),
        //     )
        //   :
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:
          // (upcomingAppointments.data.length == 0)
          //
          //     ? Center(child: Text('No upcoming appointments'))
          //     :
          (loading)
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  children: [
                    ListView.builder(

                        // physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: labPackages.data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: (index + 1 == labPackages.data.length)
                                      ? 70
                                      : 10.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: titleColumn(
                                                      title: 'Booking id',
                                                      value: labPackages
                                                          .data[index]
                                                          .bookingId),
                                                ),
                                                Expanded(
                                                  child: titleColumn(
                                                      title: 'Date of Booking',
                                                      value: labPackages
                                                          .data[index]
                                                          .bookingDate),
                                                )
                                              ],
                                            ),
                                            titleColumn(
                                                title: 'Patient Name',
                                                value: labPackages
                                                    .data[index].patientName),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: titleColumn(
                                                      title: 'Package Name',
                                                      value: labPackages
                                                          .data[index]
                                                          .packageName),
                                                ),
                                                // Expanded(
                                                //   child: titleColumn(
                                                //       title: 'Package Result',
                                                //       value: labPackages.data[index]),
                                                // )
                                              ],
                                            ),
                                            titleColumn(
                                                title: 'Amount',
                                                value: labPackages
                                                    .data[index].ammount),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: appblueColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0))),
                                        child: Center(
                                            child: Text(
                                          'View Details',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: commonBtn(
                            borderRadius: 10,
                            s: 'ViewAll',
                            bgcolor: appblueColor,
                            textColor: Colors.white,
                            onPressed: () {}),
                      ),
                    )
                  ],
                ),
    );
  }
}

class Completed extends StatefulWidget {
  const Completed({Key? key}) : super(key: key);

  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  // late CompletedAssignmentModel completedAssignment;
  // bool loading = true;
  //
  // Future<CompletedAssignmentModel> getcompleted() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   late Map<String, dynamic> response;
  //   await PostData(PARAM_URL: 'completed_assignment.php', params: {
  //     'token': Token,
  //     'doctor_id': preferences.getString('user_id')
  //   }).then((value) {
  //     response = value;
  //   });
  //   return CompletedAssignmentModel.fromJson(response);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getcompleted().then((value) {
    //   setState(() {
    //     completedAssignment = value;
    //     loading = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return
        // (loading)
        //   ? Center(
        //       child: CircularProgressIndicator(),
        //     )
        //   :
        Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:
          // (upcomingAppointments.data.length == 0)
          //
          //     ? Center(child: Text('No upcoming appointments'))
          //     :
          Stack(
        children: [
          ListView.builder(

              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 10.0,
                        bottom: (index + 1 == 10) ? 70 : 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: titleColumn(
                                            title: 'Booking id',
                                            value: 'value'),
                                      ),
                                      Expanded(
                                        child: titleColumn(
                                            title: 'Date of Booking',
                                            value: 'value'),
                                      )
                                    ],
                                  ),
                                  titleColumn(
                                      title: 'Patient Name', value: 'value'),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: titleColumn(
                                            title: 'Lab Test Name',
                                            value: 'value'),
                                      ),
                                      Expanded(
                                        child: titleColumn(
                                            title: 'Lab Test Result',
                                            value: 'value'),
                                      )
                                    ],
                                  ),
                                  titleColumn(title: 'Amount', value: 'value'),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: appblueColor,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Center(
                                  child: Text(
                                'View Details',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      ),
                    ));
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: commonBtn(
                  borderRadius: 10,
                  s: 'ViewAll',
                  bgcolor: appblueColor,
                  textColor: Colors.white,
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }
}
