import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:waffer/constants/colors.dart';
import 'package:waffer/utils/extensions.dart';
import 'package:waffer/utils/helpers.dart';

class GraphWidget extends StatelessWidget {
  GraphWidget({super.key});

  final List<Feature> features = [
    Feature(
      color: WColors.blue,
      data: getIncomeTransactionsRate,
    ),
    Feature(
      color: WColors.red,
      data: getOutcomeTransactionsRate,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return LineGraph(
      features: features,
      size: Size(context.width - 150, context.height / 7),
      labelX: const [' 1', ' 2', ' 3'],
      labelY: const ['10%', '50%', '100%'],
      showDescription: false,
      graphColor: WColors.grey,
      graphOpacity: 0,
      verticalFeatureDirection: true,
      descriptionHeight: 130,
    );
  }
}
