import 'dart:convert';

import 'package:ciam_lab/API%20repo/api_constants.dart';
import 'package:ciam_lab/controller/navigation_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FirebaseNotificationHandling {
  Future sendNotification({required String user_id}) async {
    var response = await http.post(
        Uri.parse(
            'http://ciam.notionprojects.tech/api/patient/send_notification.php'),
        body: {'token': Token, 'user_id': user_id});
    print(response.body);
    var Response = jsonDecode(response.body);
    return Response;
  }

  void setupFirebase(BuildContext context) {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((event) {
      print('onMessage ' + event.toString());

      print(event.data);

    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('onMessageOpenedApp');

    });
    FirebaseMessaging.onBackgroundMessage((message) async {
      print(message.data);

    });
  }
}
