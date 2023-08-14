import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  double opacityLevel = 1.0;
  @override
  Widget build(BuildContext context) {
    final height = Data.isExpanded ? context.height / 3 : context.height / 6;

    return Stack(
      children: [
        InkWell(
          onTap: () async {
            Data.isExpanded = !Data.isExpanded;

            setState(() {});
            context.findAncestorStateOfType<MyHomePageState>()?.setState(() {});
          },
          child: AnimatedOpacity(
            opacity: opacityLevel,
            duration: const Duration(seconds: 2),
            child: Container(
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
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 120,
          top: 90,
          child: IconButton(icon: Icon( opacityLevel == 0 ? Icons.visibility_off : Icons.remove_red_eye,
                color: WColors.grey,
              ),
              onPressed: () {
                setState(() {
                  opacityLevel = opacityLevel == 0.0 ? 1.0 : 0.0;
                });
              }),
        ),
      ],
    );
  }
}
