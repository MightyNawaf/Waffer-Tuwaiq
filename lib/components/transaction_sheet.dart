import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter_waffer/constants/spacings.dart';
import 'package:flutter_waffer/globals/data.dart';
import 'package:flutter_waffer/utils/extensions.dart';

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
          const Text(
            'Add Transaction',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
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
                ElegantNotification.error(
                  width: 360,
                  notificationPosition: NotificationPosition.center,
                  animation: AnimationType.fromTop,
                  title: const Text('Error'),
                  description:
                      const Text('Please don\'t leave any empty field'),
                  onDismiss: () {},
                ).show(context);
                // AwesomeDialog(
                //   context: context,
                //   dialogType: DialogType.error,
                //   animType: AnimType.rightSlide,
                //   title: 'Warning',
                //   desc: 'Please complete all fields',
                // ).show();
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
                ElegantNotification.success(
                  width: 360,
                  notificationPosition: NotificationPosition.center,
                  animation: AnimationType.fromTop,
                  title: const Text('Add Entry'),
                  description: const Text('Your entry has been added'),
                  onDismiss: () {},
                ).show(context);
                // showDialog(
                //   context: context,
                //   builder: (context) {
                //     return Container(
                //       margin: const EdgeInsets.all(24),
                //       child: const RiveAnimation.asset('assets/rive/success.riv'),
                //     );
                //   },
                // );

                // Future.delayed(const Duration(seconds: 2), () {
                //   Navigator.pop(context);
                //   Navigator.pop(context);
                // });
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
