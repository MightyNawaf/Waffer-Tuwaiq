import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:waffer/components/budget_card.dart';
import 'package:waffer/components/page_header.dart';
import 'package:waffer/components/scaffold.dart';
import 'package:waffer/components/transaction_card.dart';
import 'package:waffer/constants/colors.dart';
import 'package:waffer/globals/data.dart';
import 'package:waffer/pages/settings_page.dart';
import 'package:waffer/utils/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final stackHeight = Data.isExpanded ? context.height / 1.77 : context.height / 2.5;

    return WScaffold(
      top: false,
      bottom: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: WColors.blue,
        actions: [
          InkWell(
            onTap: () {
              const SettingsPage().show(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(24),
              child: Icon(
                Icons.settings,
              ),
            ),
          )
        ],
      ),
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
