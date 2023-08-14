import 'package:flutter/material.dart';
import 'package:waffer/components/budget_card.dart';
import 'package:waffer/components/page_header.dart';
import 'package:waffer/components/scaffold.dart';
import 'package:waffer/components/transaction_card.dart';
import 'package:waffer/globals/data.dart';
import 'package:waffer/utils/extensions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final stackHeight = Data.isExpanded ? context.height / 1.77 : context.height / 2.5;

    return WScaffold(
      top: false,
      bottom: false,
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: stackHeight,
              ),
              const PageHeader(),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: BudgetCard(
                  onSheetClosed: () {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final transaction in Data.transactions)
                  TransactionCard(
                    transaction: transaction,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
