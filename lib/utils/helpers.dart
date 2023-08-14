import 'package:flutter/material.dart';
import 'package:waffer/constants/colors.dart';
import 'package:waffer/globals/data.dart';

String get getLastTransaction {
  if (Data.transactions.isEmpty) return '';

  final getLastTransaction = Data.transactions[Data.transactions.length - 1];
  final sign = getLastTransaction.type == TransactionType.income ? '+' : '-';
  final amount = getLastTransaction.amount;

  return '$sign \$$amount';
}

Color get getLastTransactionColor {
  if (Data.transactions.isEmpty) return Colors.white;
  final getLastTransaction = Data.transactions[Data.transactions.length - 1];
  final color = getLastTransaction.type == TransactionType.income ? WColors.green : WColors.red;

  return color;
}
