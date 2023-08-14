import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:waffer/constants/spacings.dart';
import 'package:waffer/globals/data.dart';
import 'package:waffer/utils/extensions.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AddTransactionSheet extends StatefulWidget {
  const AddTransactionSheet({super.key});

  @override
  State<AddTransactionSheet> createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  TransactionType type = TransactionType.income;

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
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Add Transaction',
                textStyle: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 300),
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 300),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          // const Text(
          //   'Add Transaction',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          // ),
          kVSpace24,

          // Title textfield
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'i.e: Car Wash',
                label: Text('Title')),
          ),

          kVSpace8,

          // Amount textfield
          TextField(
            controller: amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'i.e: 1000',
                label: Text('Amount')),
          ),
          kVSpace16,

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Income'),
              Radio(
                value: type,
                groupValue: TransactionType.income,
                onChanged: (newType) {
                  type = TransactionType.income;
                  setState(() {});
                },
              ),
              const Text('Outcome'),
              Radio(
                value: type,
                groupValue: TransactionType.outcome,
                onChanged: (newType) {
                  type = TransactionType.outcome;
                  setState(() {});
                },
              ),
            ],
          ),
          kVSpace24,
          // Submit button
          ElevatedButton(
            onPressed: () async {
              if (amountController.text.isEmpty ||
                  titleController.text.isEmpty) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'Warning',
                  desc: 'Please complete all fields',
                ).show();
              } else {
                Data.transactions.add(
                  Transaction(
                    amount: double.tryParse(amountController.text) ?? 0,
                    icon: Icons.percent,
                    title: titleController.text,
                    type: type,
                  ),
                );
                if (type == TransactionType.income) {
                  Data.balance += double.tryParse(amountController.text) ?? 0;
                } else {
                  Data.balance -= double.tryParse(amountController.text) ?? 0;
                }
                showDialog(
                  context: context,
                  builder: (context) {
                    return Container(
                      margin: const EdgeInsets.all(24),
                      child:
                          const RiveAnimation.asset('assets/rive/success.riv'),
                    );
                  },
                );

                Future.delayed(const Duration(seconds: 2), () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                });
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
