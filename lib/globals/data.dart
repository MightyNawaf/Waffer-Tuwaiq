import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Data {
  static bool isExpanded = false;
  static List<Transaction> transactions = [
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
    const Transaction(
      title: 'Car wash',
      amount: 50,
      icon: FontAwesomeIcons.car,
    ),
  ];
}

class Transaction {
  const Transaction({
    required this.amount,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
  final double amount;
}
