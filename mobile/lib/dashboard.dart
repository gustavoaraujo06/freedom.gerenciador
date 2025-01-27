
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/charts.dart';
import 'package:mobile/models/notafiscal.dart';
import 'package:mobile/notas_repository.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final notas2025 = Provider.of<NotasRepository>(context, listen: false).notas.where((x) {
      return x.data.year == 2025;
    });
    final notas2024 = Provider.of<NotasRepository>(context, listen: false).notas.where((x) {
      return x.data.year == 2024;
    });
    Map<int, double> valoresPorMes2024 = {
      for(int i = 1; i <= 12; i++) i: 0,
    };
    Map<int, double> valoresPorMes2025 = {
      for(int i = 1; i <= 12; i++) i: 0,
    };
    for(var nota in notas2024) {
      valoresPorMes2024[nota.data.month] = valoresPorMes2024[nota.data.month]! + nota.valor;
    }
    for(var nota in notas2025) {
      valoresPorMes2025[nota.data.month] = valoresPorMes2025[nota.data.month]! + nota.valor;
    }

    final barGroups = List.generate(12, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          getBarChartRodData(valoresPorMes2025[index + 1], [Colors.amber, Colors.amberAccent]),
          getBarChartRodData(valoresPorMes2024[index + 1], [Colors.blue, Colors.blueAccent]),
          ],
        barsSpace: 4,
      );
    });
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ChartCard(
              title: "2024 x 2025",
              child: BarChartExpensesMonth(barGroups: barGroups)),
        ],
      ),
    );
  }
}

BarChartRodData getBarChartRodData(double? y, List<Color> colors) {
  return BarChartRodData(
      toY: y ?? 0,
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: colors,
      ),
    );
}

enum GroupBy {
  day,
  week,
  month,
  year
}
Map<String, double> groupExpenses(List<NotaFiscal> expenses, GroupBy groupBy) {
  final map = <String, double>{};

  for (var nota in expenses) {
    final data = nota.data;
    late String key;

    switch (groupBy) {
      case GroupBy.day:
        key = DateFormat('yyyy-MM-dd').format(data);
        break;

      case GroupBy.week:
        key = DateFormat('yyyy-ww').format(data);
        break;

      case GroupBy.month:
        key = DateFormat('yyyy-MM').format(data);
        break;
      case GroupBy.year:
        key = DateFormat('yyyy').format(data);
        break;
    }

    map[key] = (map[key] ?? 0) + nota.valor;
  }

  return map;
}
List<NotaFiscal> getExpensesRange(DateTime start, DateTime end, BuildContext context){
  final expenses = Provider.of<NotasRepository>(context, listen: false).notas.where((nota) {
    return (nota.data.isAtSameMomentAs(start) || nota.data.isAfter(start)) &&
           (nota.data.isAtSameMomentAs(end)   || nota.data.isBefore(end));
  });
  return expenses.toList();
}

