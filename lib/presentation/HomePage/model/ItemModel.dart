import 'dart:convert';

import 'package:flutter/cupertino.dart';


class ItemModel {
  ItemModel({
      required this.index,
      this.itemName,
      this.pushNamed,}) ;


  String? itemName;
  final int index;
  final String? pushNamed;



}