import 'package:flutter/material.dart';

class Data {
  static bool isExpanded = false;
  static double balance = 0;
  static List<Transaction> transactions = [
    Transaction(
        date: DateTime.now(), // added default date
        amount: 100,
        icon: Icons.abc,
        title: 'Hello',
        type: TransactionType.income),
    Transaction(
        date: DateTime.now(), // added default date
        amount: 100,
        icon: Icons.abc,
        title: 'Hello',
        type: TransactionType.income),
  ];
}

class Transaction {
  Transaction(
      {required this.amount,
      required this.icon,
      required this.title,
      required this.type,
      required this.date});

  final IconData icon;
  final String title;
  final double amount;
  final TransactionType type;
  final DateTime date;
}

enum TransactionType { income, outcome }
