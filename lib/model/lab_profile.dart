// To parse this JSON data, do
//
//     final getProfile = getProfileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GetProfile getProfileFromJson(String str) =>
    GetProfile.fromJson(json.decode(str));

String getProfileToJson(GetProfile data) => json.encode(data.toJson());

class GetProfile {
  GetProfile({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory GetProfile.fromJson(Map<String, dynamic> json) => GetProfile(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.address,
  });

  String userId;
  String firstName;
  String lastName;
  String email;
  String mobileNumber;
  String address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "mobile_number": mobileNumber,
        "address": address,
      };
}
