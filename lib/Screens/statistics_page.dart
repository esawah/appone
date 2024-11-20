import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data dummy untuk grafik
    final data = [
      TaskStatistics('Completed', 60),
      TaskStatistics('Pending', 30),
      TaskStatistics('Overdue', 10),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task Statistics Overview',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SfCircularChart(
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  header: 'Task Status',
                  format: 'point.x : point.y%',
                  textStyle: TextStyle(color: Colors.white),
                ),
                series: <CircularSeries>[
                  PieSeries<TaskStatistics, String>(
                    dataSource: data,
                    xValueMapper: (TaskStatistics stats, _) => stats.status,
                    yValueMapper: (TaskStatistics stats, _) => stats.percent,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    pointColorMapper: (TaskStatistics stats, _) {
                      if (stats.status == 'Completed') {
                        return Colors.greenAccent;
                      } else if (stats.status == 'Pending') {
                        return Colors.orangeAccent;
                      } else {
                        return Colors.redAccent;
                      }
                    },
                    // Animasi pie chart
                    enableTooltip: true,
                    explode: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskStatistics {
  final String status;
  final int percent;

  TaskStatistics(this.status, this.percent);
}
