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

Widget getValueInThousand(double value, TitleMeta titleMeta, BuildContext context) {
  final ThemeData theme = Theme.of(context);
  return SideTitleWidget(
    axisSide: AxisSide.left,
    child: Text(
      (value / 1000).toStringAsFixed(0),
      style: theme.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: theme.colorScheme.secondary, 
      ),
    ),
  );
}

class BarChartExpensesMonth extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  const BarChartExpensesMonth({super.key, required this.barGroups});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return BarChart(BarChartData(
        groupsSpace: 12,
        alignment: BarChartAlignment.spaceAround,
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            axisNameWidget: Text(
              "Mês",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              )
            ),
            sideTitles: SideTitles(
                getTitlesWidget: getMounthTitle,
                showTitles: true,
                reservedSize: 26),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: Text(
              "Valor (R\$ Mil)",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              )
            ),
            sideTitles: SideTitles(
              interval: 100000,
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) => getValueInThousand(value, meta, context),
              reservedSize: 40,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: theme.dividerColor.withValues(alpha: 0.2),
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
              getTooltipColor: (group) {
                return theme.colorScheme.surface.withValues(alpha: 0.9);
              },
              getTooltipItem: (group, groupIndex, BarChartRodData data, rodIndex) {
              return BarTooltipItem(
                NumberFormat.simpleCurrency(locale: 'pt_BR').format(data.toY),
                TextStyle(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              );
            },
            ))));
  }
}
class LineChartExpensesMonth extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  const LineChartExpensesMonth({super.key, required this.barGroups});
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return LineChart(LineChartData(
      minY: 0,
      minX: 0,
      maxX: 11,
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            axisNameWidget: Text(
              "Mês",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              )
            ),
            sideTitles: SideTitles(
                getTitlesWidget: getMounthTitle,
                showTitles: true,
                reservedSize: 26),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: Text(
              "Valor (R\$ Mil)",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              )
            ),
            sideTitles: SideTitles(
              interval: 100000,
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) => getValueInThousand(value, meta, context),
              reservedSize: 40,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: theme.dividerColor.withValues(alpha: 0.2),
              strokeWidth: 1,
            );
          },
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, barGroups[0].barRods[0].toY),
              FlSpot(1, barGroups[1].barRods[0].toY),
              FlSpot(2, barGroups[2].barRods[0].toY),
              FlSpot(3, barGroups[3].barRods[0].toY),
              FlSpot(4, barGroups[4].barRods[0].toY),
              FlSpot(5, barGroups[5].barRods[0].toY),
              FlSpot(6, barGroups[6].barRods[0].toY),
              FlSpot(7, barGroups[7].barRods[0].toY),
              FlSpot(8, barGroups[8].barRods[0].toY),
              FlSpot(9, barGroups[9].barRods[0].toY),
              FlSpot(10, barGroups[10].barRods[0].toY),
              FlSpot(11, barGroups[11].barRods[0].toY),
            ],
            isCurved: false,
            barWidth: 3,
            color: theme.colorScheme.primary,
          )
        ],
        ));
  }
}
class ChartCard extends StatelessWidget{
  final Widget child;
  final String title;
  const ChartCard({super.key, required this.child, required this.title});
  @override
  Widget build(BuildContext context) {
      final ThemeData theme = Theme.of(context);
    return Card(
      color: theme.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(height: 8),
                    AspectRatio(
                      aspectRatio: 2.2,
                      child: child,
                    )
                  ],
                ),
              ));
  }
}