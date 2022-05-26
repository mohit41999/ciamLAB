// To parse this JSON data, do
//
//     final labPackageModel = labPackageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LabPackageModel labPackageModelFromJson(String str) =>
    LabPackageModel.fromJson(json.decode(str));

String labPackageModelToJson(LabPackageModel data) =>
    json.encode(data.toJson());

class LabPackageModel {
  LabPackageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<LabPackageModelData> data;

  factory LabPackageModel.fromJson(Map<String, dynamic> json) =>
      LabPackageModel(
        status: json["status"],
        message: json["message"],
        data: List<LabPackageModelData>.from(
            json["data"].map((x) => LabPackageModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LabPackageModelData {
  LabPackageModelData({
    required this.bookingId,
    required this.bookingDate,
    required this.patientName,
    required this.packageName,
    required this.ammount,
  });

  final String bookingId;
  final String bookingDate;
  final String patientName;
  final String packageName;
  final String ammount;

  factory LabPackageModelData.fromJson(Map<String, dynamic> json) =>
      LabPackageModelData(
        bookingId: json["booking_id"],
        bookingDate: json["booking_date"],
        patientName: json["patient_name"],
        packageName: json["package_name"],
        ammount: json["ammount"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "booking_date": bookingDate,
        "patient_name": patientName,
        "package_name": packageName,
        "ammount": ammount,
      };
}
