import 'package:ciam_lab/Utils/colorsandstyles.dart';
import 'package:ciam_lab/widgets/common_button.dart';
import 'package:ciam_lab/widgets/title_enter_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestForRedemption extends StatefulWidget {
  const RequestForRedemption({Key? key}) : super(key: key);

  @override
  _RequestForRedemptionState createState() => _RequestForRedemptionState();
}

class _RequestForRedemptionState extends State<RequestForRedemption> {
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleEnterField('Enter Amount', 'Amount', amount),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: commonBtn(
                s: 'Submit  ',
                bgcolor: appblueColor,
                textColor: Colors.white,
                onPressed: () {},
                borderRadius: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
