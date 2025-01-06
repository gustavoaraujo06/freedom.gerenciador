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

    /// Agora criamos 12 grupos (um para cada mês), cada grupo com 2 barras
    final barGroups = List.generate(12, (index) {
      // Cada mês tem duas barras, barRod1 e barRod2
      return BarChartGroupData(
        x: index,
        barRods: index <= 5 ? [barRodPrimary.copyWith(toY: Random().nextDouble() * 600000), barRodSecondary.copyWith(toY: Random().nextDouble() * 600000)] : [barRodPrimary.copyWith(toY: Random().nextDouble() * 600000)],
        // Espaço entre as duas barras do mesmo grupo
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
