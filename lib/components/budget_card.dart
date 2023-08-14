import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:waffer/components/graph_widget.dart';
import 'package:waffer/components/transaction_sheet.dart';
import 'package:waffer/constants/colors.dart';
import 'package:waffer/constants/spacings.dart';
import 'package:waffer/globals/data.dart';
import 'package:waffer/pages/home.dart';
import 'package:waffer/utils/extensions.dart';
import 'package:waffer/utils/helpers.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({super.key, required this.onSheetClosed});

  final Function() onSheetClosed;

  @override
  State<BudgetCard> createState() => _BudgetCardState();
}

class _BudgetCardState extends State<BudgetCard> {
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
            // if it not expanded show the default card else show the graph
            child: !Data.isExpanded
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          kVSpace8,
                          Row(
                            children: [
                              Text(
                                '\$${Data.balance}',
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                ),
                              ).shimmered,
                              kHSpace8,
                              const Icon(
                                Icons.remove_red_eye,
                                color: WColors.grey,
                              )
                            ],
                          ),
                          kVSpace16,
                          Text(
                            getLastTransaction,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: getLastTransactionColor,
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
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      kVSpace32,
                      GraphWidget(),
                      kVSpace32,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Total Income',
                                style: TextStyle(color: WColors.grey),
                              ),
                              Text(
                                '\$$getIncomeTransactionsTotal',
                                style: const TextStyle(color: WColors.blue),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Total Outcome',
                                style: TextStyle(color: WColors.grey),
                              ),
                              Text(
                                '\$$getOutcomeTransactionsTotal',
                                style: const TextStyle(color: WColors.red),
                              )
                            ],
                          )
                        ],
                      )
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
