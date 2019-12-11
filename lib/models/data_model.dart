import 'package:flutter/foundation.dart';

class DataModel {
  @required
  final String id;
  @required
  final String title;
  @required
  final double amount;
  @required
  final DateTime date;

  DataModel({this.id, this.title, this.amount, this.date});
}
