import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inventory_tracker/core/utils/common.dart';

class ChartData {
  final String date;
  final double val;
  final bool isSelected;

  ChartData(this.date, this.val, [this.isSelected = false]);
}

class BarChartWrapper<T> extends StatefulWidget {
  final Map<int, ChartData> data;
  final Widget? actionWidget;
  final double aspectRatio;
  final int widthPercentage;
  final String yLabel;

  const BarChartWrapper(
      {Key? key,
      required this.data,
      this.actionWidget,
      this.yLabel = "Profit",
      this.widthPercentage = 94,
      this.aspectRatio = 2})
      : super(key: key);

  @override
  State<BarChartWrapper> createState() => _BarChartWrapperState();
}

class _BarChartWrapperState extends State<BarChartWrapper> {
  Map<int, ChartData> get data => widget.data;

  double getMax() {
    var mx = 0;
    data.forEach((key, value) {
      mx = max(mx, value.val.ceil());
    });
    var l = mx.toString().length - 1;
    return (mx ~/ pow(10, l) + 1) * pow(10, l).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.yLabel,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            widget.actionWidget ?? Container()
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        AspectRatio(
          aspectRatio: widget.aspectRatio,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: const EdgeInsets.only(top: 6),
              width: widthQuery(context, widget.widthPercentage),
              height: double.infinity,
              child: BarChart(
                BarChartData(
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              reservedSize: 50,
                              showTitles: true,
                              getTitlesWidget: (key, t) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    data[key.toInt()]!.date,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                );
                              })),
                      rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: false,
                      )),
                      topTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: false,
                      )),
                    ),
                    minY: 0,
                    maxY: getMax(),
                    barGroups: data.keys
                        .map((key) => BarChartGroupData(
                              x: key,
                              barRods: [
                                BarChartRodData(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4.0)),
                                    width: 12.0,
                                    toY: data[key]!.val,
                                    color: data[key]!.isSelected
                                        ? Colors.black87
                                        : Colors.grey)
                              ],
                            ))
                        .toList()),
                swapAnimationDuration: const Duration(seconds: 1),
                swapAnimationCurve: Curves.decelerate, // Optional
              ),
            ),
          ),
        ),
      ],
    );
  }
}
