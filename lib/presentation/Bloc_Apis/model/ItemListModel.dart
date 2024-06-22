import 'Data.dart';
import 'dart:convert';

/// status : "valid"
/// message : "Profiles Getting Successful"
/// total_count : 2
/// data : [{"id":6,"category":null,"name":"Healthy Full Body Checkups","profile_code":"D032","tests":"5,6","image":"https://demo.colormoon.in/speeddiagno/public/uploads/tests/profile_767006220.jpg","mrp":"6000","price":"3000","comments":"<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>","status":1,"created_at":"2024-03-16T08:42:58.000000Z","updated_at":"2024-03-16T08:42:58.000000Z","is_it_popular":"Yes","offer_amount":3000,"offer_percent":50,"no_of_tests":"2 Tests Included","is_in_cart":"No"},{"id":7,"category":null,"name":"Basic Health Screening","profile_code":"BHS2024","tests":"7","image":"https://demo.colormoon.in/speeddiagno/public/uploads/tests/profile_1288554274.jpg","mrp":"3500","price":"2800","comments":"<p>This profile is ideal for individuals looking for a quick health assessment. It includes essential tests to monitor blood pressure, blood sugar, and cholesterol levels, providing valuable insights into overall health and potential risk factors.<br></p>","status":1,"created_at":"2024-04-06T07:21:57.000000Z","updated_at":"2024-04-06T07:21:57.000000Z","is_it_popular":"Yes","offer_amount":700,"offer_percent":80,"no_of_tests":"1 Tests Included","is_in_cart":"No"}]

ItemListModel itemListModelFromJson(String str) => ItemListModel.fromJson(json.decode(str));
String itemListModelToJson(ItemListModel data) => json.encode(data.toJson());
class ItemListModel {
  ItemListModel({
      this.status, 
      this.message, 
      this.totalCount, 
      this.data,});

  ItemListModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    totalCount = json['total_count'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  String? message;
  int? totalCount;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['total_count'] = totalCount;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}