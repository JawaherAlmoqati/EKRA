import 'package:ekra/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';

class OrderModel {
  String? orderId;
  String customerName;
  ProductModel? item;
  num totalAmount;
  int quantity;
  DateTime orderDate;
  RangeValues? rangeValues;
  String? customerId;
  OrderStatus? status;

  OrderModel({
    required this.orderId,
    required this.customerName,
    required this.item,
    required this.totalAmount,
    required this.quantity,
    required this.orderDate,
    this.rangeValues,
    this.customerId,
    this.status,
  });

  static OrderModel empty() => OrderModel(
        orderId: '',
        customerName: '',
        item: null,
        totalAmount: 0,
        orderDate: DateTime.now(),
        rangeValues: null,
        quantity: 0,
        customerId: '',
        status: OrderStatus.pending,
      );

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'customerName': customerName,
      'item': item!.toJson(),
      'totalAmount': totalAmount,
      'quantity': quantity,
      'orderDate': orderDate.toIso8601String(),
      'rangeValues': '${rangeValues!.start},${rangeValues!.end}',
      'customerId': customerId,
      'status': status?.index,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderId: json['orderId'],
      customerName: json['customerName'],
      item: ProductModel.fromJson(json['item']),
      totalAmount: json['totalAmount'],
      quantity: json['quantity'],
      orderDate: DateTime.parse(json['orderDate']),
      rangeValues: RangeValues(
        double.tryParse(json['rangeValues'].split(',').first) ?? 0.0,
        double.tryParse(json['rangeValues'].split(',').last) ?? 0.0,
      ),
      customerId: json['customerId'],
      status: OrderStatus.values[json['status']],
    );
  }
}

enum OrderStatus { pending, onRent, completed, cancelled }
