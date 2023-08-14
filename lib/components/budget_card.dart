import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:odometer/odometer.dart';
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
                        //Mjd changes start here
                        const Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        AnimatedSlideOdometerNumber(
                          odometerNumber: OdometerNumber(Data.balance.round()),
                          duration: const Duration(milliseconds: 2000),
                          letterWidth: 20,
                          numberTextStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Text(
                        //   '\$${Data.balance}',
                        //   style: const TextStyle(
                        //     fontSize: 40,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        // ).shimmered,
                        kHSpace8,
                        const Icon(
                          Icons.remove_red_eye,
                          color: WColors.grey,
                        )
                      ],
                    ).shimmered,
                    //Mjd changes end here
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
