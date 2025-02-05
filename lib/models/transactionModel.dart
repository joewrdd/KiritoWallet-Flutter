import 'package:flutter/material.dart';

enum TransactionType { topUp, transfer, received }

class TransactionModel {
  final String id;
  final double amount;
  final TransactionType type;
  final String date;
  final String description;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.type,
    required this.date,
    required this.description,
  });

  String get image {
    switch (type) {
      case TransactionType.topUp:
        return 'assets/icons/heart.png';
      case TransactionType.transfer:
        return 'assets/icons/dragon-3.png';
      case TransactionType.received:
        return 'assets/icons/shark.png';
    }
  }

  Color get color {
    switch (type) {
      case TransactionType.topUp:
        return Colors.green;
      case TransactionType.transfer:
        return Colors.red;
      case TransactionType.received:
        return Colors.blue;
    }
  }

  static List<TransactionModel> getDummyTransactions() {
    return [
      TransactionModel(
        id: '1',
        amount: 500.0,
        type: TransactionType.topUp,
        date: '2024-03-21',
        description: 'Added funds to wallet',
      ),
      TransactionModel(
        id: '2',
        amount: 89.0,
        type: TransactionType.topUp,
        date: '2024-03-20',
        description: 'Added funds to wallet',
      ),
      TransactionModel(
        id: '3',
        amount: 200.0,
        type: TransactionType.transfer,
        date: '2024-03-19',
        description: 'Sent to Tina',
      ),
      TransactionModel(
        id: '4',
        amount: 350.0,
        type: TransactionType.received,
        date: '2024-03-18',
        description: 'Received from Gaby',
      ),
    ];
  }
}
