import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget getMounthTitle(double value, TitleMeta titleMeta) {
  const style = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  String text;
  switch (value) {
    case 0:
      text = "Jan";
      break;
    case 1:
      text = "Fev";
      break;
    case 2:
      text = "Mar";
      break;
    case 3:
      text = "Abr";
      break;
    case 4:
      text = "Mai";
      break;
    case 5:
      text = "Jun";
      break;
    case 6:
      text = "Jul";
      break;
    case 7:
      text = "Ago";
      break;
    case 8:
      text = "Set";
      break;
    case 9:
      text = "Out";
      break;
    case 10:
      text = "Nov";
      break;
    case 11:
      text = "Dez";
      break;
    default:
      text = "";
  }
  return SideTitleWidget(
    axisSide: AxisSide.bottom,
    angle: 0.4,
    child: Text(text, style: style),
  );
}

Widget getValueTitle(double value, TitleMeta meta) {
  return SideTitleWidget(
    axisSide: AxisSide.left,
    child: Text((value / 1000).toStringAsFixed(0)),
  );
}

class Dashboard extends StatelessWidget {
  // Gerando aleatoriamente 12 barras (uma para cada mês).

  @override
  Widget build(BuildContext context) {
    final randomData = List.generate(12, (index) {
      return BarChartRodData(
        toY: Random().nextDouble() * 600000,
        // Aqui usamos um gradiente sutil de Amber para AmberAccent:
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.amber,
            Colors.amberAccent,
          ],
        ),
        // Deixando a barra mais "grossinha" e com bordas arredondadas:
        width: 18,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(6),
          topRight: Radius.circular(6),
        ),
      );
    });
    final barGroups = List.generate(12, (index) {
      return BarChartGroupData(x: index, barRods: [randomData[index]]);
    });
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                    "Gastos Esse Ano",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.amber[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                AspectRatio(
                    aspectRatio: 2.2,
                    child: BarChart(BarChartData(
                      groupsSpace: 12,
                        alignment: BarChartAlignment.spaceAround,
                        titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              axisNameWidget: Text(
                              "Mês",
                              style: TextStyle(
                                color: Colors.amber[700],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                              sideTitles: SideTitles(
                                  getTitlesWidget: getMounthTitle,
                                  showTitles: true,
                                  reservedSize: 26),
                            ),
                            leftTitles: AxisTitles(
                            axisNameWidget: Text(
                              "Valor (R\$ Mil)",
                              style: TextStyle(
                                color: Colors.amber[700],
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            sideTitles: SideTitles(
                              interval: 100000,
                              showTitles: true,
                              getTitlesWidget: getValueTitle,
                              reservedSize: 40,
                            ),
                          ),),
                          borderData: FlBorderData(show: false),
                        gridData: FlGridData(
                          drawVerticalLine: false,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Colors.amber.withValues(alpha: 0.2),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        
                        barGroups: barGroups,
                        barTouchData: BarTouchData(
                          enabled: true,
                            touchTooltipData: BarTouchTooltipData(
                          fitInsideHorizontally: true,
                          fitInsideVertically: true,
                          tooltipPadding: EdgeInsets.all(8.0),
                          rotateAngle: 0,
                          getTooltipColor: (group){return const Color.from(alpha: 0.8, red: 0.129, green: 0.129, blue: 0.129);},
                          getTooltipItem: (group, groupIndex,
                                  BarChartRodData data, rodIndex) =>
                              BarTooltipItem(
                            NumberFormat.simpleCurrency(locale: 'pt_BR')
                                .format(data.toY),
                             TextStyle(
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                          ),
                        ))))),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
