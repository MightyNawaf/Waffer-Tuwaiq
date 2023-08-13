import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:waffer/components/scaffold.dart';
import 'package:waffer/constants/colors.dart';
import 'package:waffer/constants/spacings.dart';
import 'package:waffer/globals/data.dart';
import 'package:waffer/utils/extensions.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

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
              const _PageHeader(),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: _BudgetCard(
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
              //   physics: const NeverScrollableScrollPhysics(),
              children: [
                for (final transaction in Data.transactions)
                  _TransactionCard(
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

class _BudgetCard extends StatefulWidget {
  const _BudgetCard({required this.onSheetClosed});

  final Function() onSheetClosed;

  @override
  State<_BudgetCard> createState() => _BudgetCardState();
}

class _BudgetCardState extends State<_BudgetCard> {
  @override
  Widget build(BuildContext context) {
    final height = Data.isExpanded ? context.height / 3 : context.height / 6;

    return InkWell(
      onTap: () async {
        Data.isExpanded = !Data.isExpanded;

        setState(() {});
        context.findAncestorStateOfType<MyHomePageState>()?.setState(() {});
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    WSpacing.kVSpace8,
                    Text(
                      '\$1,294,398',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: WColors.blue,
                      ),
                    ),
                    WSpacing.kVSpace16,
                    Text(
                      '- \$70,000 today',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: WColors.red,
                      ),
                    ),
                  ],
                ),
                ZoomTapAnimation(
                  child: InkWell(
                    onTap: () async {
                      HapticFeedback.mediumImpact();
                      await showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const AddTransactionSheet();
                        },
                      );
                    //   context.findAncestorStateOfType<MyHomePageState>()?.setState(() {});
                        widget.onSheetClosed();
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: WColors.blue,
                      ),
                      height: 70,
                      width: 70,
                      child: const Icon(
                        Icons.add,
                        color: WColors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
          .animate()
          .fade(
            duration: 500.ms,
          )
          .scale(
            delay: 500.ms,
          ),
    );
  }
}

class AddTransactionSheet extends StatefulWidget {
  const AddTransactionSheet({super.key});

  @override
  State<AddTransactionSheet> createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 2,
      width: context.width,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Text(
            'Add Transaction',
            style: TextStyle(fontSize: 18),
          ),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(
            onPressed: () {
              Data.transactions.add(
                Transaction(
                    amount: double.tryParse(amountController.text) ?? 0,
                    icon: Icons.percent,
                    title: titleController.text),
              );

              Navigator.pop(context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class _PageHeader extends StatelessWidget {
  const _PageHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WColors.blue,
      height: context.height / 3.5,
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WSpacing.kVSpace128,
          Text(
            'Budgets',
            style: TextStyle(
              color: WColors.white,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionCard extends StatelessWidget {
  const _TransactionCard({required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: WColors.blue,
                ),
                margin: const EdgeInsets.only(right: 8),
                height: 50,
                width: 50,
                child: Icon(
                  transaction.icon,
                  color: WColors.white,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Text(
                      '\$700 left',
                      style: TextStyle(
                        fontSize: 12,
                        color: WColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '\$${transaction.amount}',
                    style: const TextStyle(
                      color: WColors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
