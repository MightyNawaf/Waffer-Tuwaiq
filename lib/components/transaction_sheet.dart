import 'package:flutter/material.dart';
import 'package:waffer/globals/data.dart';
import 'package:waffer/utils/extensions.dart';

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
