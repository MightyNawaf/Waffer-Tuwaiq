import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_waffer/components/budget_card.dart';
import 'package:flutter_waffer/components/page_header.dart';
import 'package:flutter_waffer/components/scaffold.dart';
import 'package:flutter_waffer/components/transaction_card.dart';
import 'package:flutter_waffer/constants/colors.dart';
import 'package:flutter_waffer/globals/data.dart';
import 'package:flutter_waffer/utils/extensions.dart';

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
            child: LiquidPullToRefresh(
              color: WColors.blue,
              animSpeedFactor: 10,
              showChildOpacityTransition: false,
              springAnimationDurationInMilliseconds: 500,
              onRefresh: () {
                return Future.delayed(const Duration(milliseconds: 500), () {
                  setState(() {});
                });
              },
              child: AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: Data.transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: FlipAnimation(
                        // verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: TransactionCard(
                            transaction: Data.transactions[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
