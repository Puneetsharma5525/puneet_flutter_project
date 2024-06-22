import 'dart:convert';

/// id : 6
/// category : null
/// name : "Healthy Full Body Checkups"
/// profile_code : "D032"
/// tests : "5,6"
/// image : "https://demo.colormoon.in/speeddiagno/public/uploads/tests/profile_767006220.jpg"
/// mrp : "6000"
/// price : "3000"
/// comments : "<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br></p>"
/// status : 1
/// created_at : "2024-03-16T08:42:58.000000Z"
/// updated_at : "2024-03-16T08:42:58.000000Z"
/// is_it_popular : "Yes"
/// offer_amount : 3000
/// offer_percent : 50
/// no_of_tests : "2 Tests Included"
/// is_in_cart : "No"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.category, 
      this.name, 
      this.profileCode, 
      this.tests, 
      this.image, 
      this.mrp, 
      this.price, 
      this.comments, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.isItPopular, 
      this.offerAmount, 
      this.offerPercent, 
      this.noOfTests, 
      this.isInCart,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    category = json['category'];
    name = json['name'];
    profileCode = json['profile_code'];
    tests = json['tests'];
    image = json['image'];
    mrp = json['mrp'];
    price = json['price'];
    comments = json['comments'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isItPopular = json['is_it_popular'];
    offerAmount = json['offer_amount'];
    offerPercent = json['offer_percent'];
    noOfTests = json['no_of_tests'];
    isInCart = json['is_in_cart'];
  }
  num? id;
  dynamic category;
  String? name;
  String? profileCode;
  String? tests;
  String? image;
  String? mrp;
  String? price;
  String? comments;
  num? status;
  String? createdAt;
  String? updatedAt;
  String? isItPopular;
  num? offerAmount;
  num? offerPercent;
  String? noOfTests;
  String? isInCart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category'] = category;
    map['name'] = name;
    map['profile_code'] = profileCode;
    map['tests'] = tests;
    map['image'] = image;
    map['mrp'] = mrp;
    map['price'] = price;
    map['comments'] = comments;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['is_it_popular'] = isItPopular;
    map['offer_amount'] = offerAmount;
    map['offer_percent'] = offerPercent;
    map['no_of_tests'] = noOfTests;
    map['is_in_cart'] = isInCart;
    return map;
  }

}