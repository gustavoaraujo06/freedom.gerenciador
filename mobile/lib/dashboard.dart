import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/charts.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final barRodPrimary = BarChartRodData(
      toY: Random().nextDouble() * 600000,
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          theme.colorScheme.primary,
          theme.colorScheme.primaryContainer,
        ],
      ),
    );

    final barRodSecondary = BarChartRodData(
      toY: Random().nextDouble() * 600000,
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          theme.colorScheme.secondary,
          theme.colorScheme.secondaryContainer,
        ],
      ),
    );

    final barGroups = List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barRods: index <= 5 ? [barRodPrimary.copyWith(toY: Random().nextDouble() * 600000), barRodSecondary.copyWith(toY: Random().nextDouble() * 600000)] : [barRodPrimary.copyWith(toY: Random().nextDouble() * 600000)],
        barsSpace: 4,
      );
    });
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ChartCard(
              title: "Gastos Teste",
              child: BarChartExpensesMonth(barGroups: barGroups)),
            ChartCard(title: "Linha Teste", child: LineChartExpensesMonth(barGroups: barGroups)),
        ],
      ),
    );
  }
}
