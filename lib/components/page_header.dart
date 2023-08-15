import 'package:flutter/material.dart';
import 'package:flutter_waffer/constants/colors.dart';
import 'package:flutter_waffer/constants/spacings.dart';
import 'package:flutter_waffer/utils/extensions.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: WColors.blue,
      height: context.height / 3.5,
      width: context.width,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          kVSpace128,
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
