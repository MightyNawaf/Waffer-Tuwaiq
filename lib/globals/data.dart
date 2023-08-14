import 'package:flutter/material.dart';

class Data {
  static bool isExpanded = false;
  static double balance = 0;
  static List<Transaction> transactions = [
    const Transaction(
        amount: 100,
        icon: Icons.abc,
        title: 'Hello',
        type: TransactionType.income),
    const Transaction(
        amount: 100,
        icon: Icons.abc,
        title: 'Hello',
        type: TransactionType.income),
  ];
}

class Transaction {
  const Transaction(
      {required this.amount,
      required this.icon,
      required this.title,
      required this.type});

  final IconData icon;
  final String title;
  final double amount;
  final TransactionType type;
}

enum TransactionType { income, outcome }
