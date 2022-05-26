// To parse this JSON data, do
//
//     final labTestModel = labTestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LabTestModel labTestModelFromJson(String str) =>
    LabTestModel.fromJson(json.decode(str));

String labTestModelToJson(LabTestModel data) => json.encode(data.toJson());

class LabTestModel {
  LabTestModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<LabTestModelData> data;

  factory LabTestModel.fromJson(Map<String, dynamic> json) => LabTestModel(
        status: json["status"],
        message: json["message"],
        data: List<LabTestModelData>.from(
            json["data"].map((x) => LabTestModelData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LabTestModelData {
  LabTestModelData({
    required this.bookingId,
    required this.bookingDate,
    required this.patientName,
    required this.labTestName,
    required this.labTestResult,
    required this.ammount,
  });

  final String bookingId;
  final String bookingDate;
  final String patientName;
  final String labTestName;
  final String labTestResult;
  final String ammount;

  factory LabTestModelData.fromJson(Map<String, dynamic> json) =>
      LabTestModelData(
        bookingId: json["booking_id"] == null ? '' : json["booking_id"],
        bookingDate: json["booking_date"],
        patientName: json["patient_name"],
        labTestName: json["lab_test_name"] == null ? '' : json["lab_test_name"],
        labTestResult: json["lab_test_result"],
        ammount: json["ammount"] == null ? '' : json["ammount"],
      );

  Map<String, dynamic> toJson() => {
        "booking_id": bookingId,
        "booking_date": bookingDate,
        "patient_name": patientName,
        "lab_test_name": labTestName,
        "lab_test_result": labTestResult,
        "ammount": ammount,
      };
}
