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
  final color = getLastTransaction.type == TransactionType.income
      ? WColors.green
      : WColors.red;

  return color;
}

get getIncomeTransactionsRate {
  for (var element in Data.transactions) {
    if (element.type == TransactionType.income) {
      Data.incomeTransactionsRate.add((element.amount / 100));
    }
  }

  return Data.incomeTransactionsRate;
}

get getIncomeTransactionsTotal {
  double totalIncomeTransactions = 0.0;
  for (var element in Data.transactions) {
    if (element.type == TransactionType.income) {
      totalIncomeTransactions += element.amount;
    }
  }

  return totalIncomeTransactions;
}

get getOutcomeTransactionsRate {
  for (var element in Data.transactions) {
    if (element.type == TransactionType.outcome) {
      Data.outcomeTransactionsRate.add((element.amount / 100));
    }
  }

  return Data.outcomeTransactionsRate;
}

get getOutcomeTransactionsTotal {
  double totalOutcomeTransactions = 0.0;
  for (var element in Data.transactions) {
    if (element.type == TransactionType.outcome) {
      totalOutcomeTransactions += element.amount;
    }
  }

  return totalOutcomeTransactions;
}
