import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceCard extends StatelessWidget {
  final bool isExpanded;
  const PerformanceCard({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Stacked Legend matching mockup
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Over All Performance',
                    style: TextStyle(
                      color: Color(0xFF1B254B),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'The Years',
                    style: TextStyle(
                      color: Color(0xFF1B254B),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pending Legend (Stacked two-line text)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFFE98C8C), // Pink dot
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pending',
                            style: TextStyle(
                              color: Color(0xFFE98C8C),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                          Text(
                            'Done',
                            style: TextStyle(
                              color: Color(0xFFE98C8C),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  // Project Legend (Stacked two-line text)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF4318FF), // Deep purple dot
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Project',
                            style: TextStyle(
                              color: Color(0xFF3F3B8F), // Indigo text
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                          Text(
                            'Done',
                            style: TextStyle(
                              color: Color(0xFF3F3B8F),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Line Chart View inside a Stack (conditional sizing: Expanded vs SizedBox)
          isExpanded
              ? Expanded(
                  child: _buildChartStack(),
                )
              : SizedBox(
                  height: 160, // Compressed height
                  child: _buildChartStack(),
                ),
        ],
      ),
    );
  }

  Widget _buildChartStack() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        // Calculate dynamic horizontal offset for 2018 (x=3.0)
        // Left titles reserved size is 28. Right margin padding is around 16.
        final double leftOffset = 28 + (width - 44) * (3.0 / 5.2);
        
        // Calculate dynamic vertical height for the curve dot at 2018 (y=45.0)
        final double height = isExpanded ? constraints.maxHeight : 160;
        final double drawingHeight = height - 30; // 30 is bottomTitle reserved size
        const double purpleValueAt2018 = 45.0;
        final double dotTop = drawingHeight - (purpleValueAt2018 / 50.0) * drawingHeight;

        return Stack(
          clipBehavior: Clip.none,
          children: [
            // Clean Chart with bottom and left border lines, and no grid lines
            LineChart(
              LineChartData(
                gridData: const FlGridData(
                  show: false, // No dashed grid lines inside chart area
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 10,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        if (value >= 0 && value <= 50) {
                          return SideTitleWidget(
                            meta: meta,
                            space: 6,
                            child: Text(
                              value.toInt().toString(),
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        String text = '';
                        switch (value.toInt()) {
                          case 0:
                            text = '2015';
                            break;
                          case 1:
                            text = '2016';
                            break;
                          case 2:
                            text = '2017';
                            break;
                          case 3:
                            text = '2018';
                            break;
                          case 4:
                            text = '2019';
                            break;
                          case 5:
                            text = '2020';
                            break;
                        }
                        // Only show labels for integer points up to 5
                        if (value % 1 == 0 && value >= 0 && value <= 5) {
                          return SideTitleWidget(
                            meta: meta,
                            space: 10,
                            child: Text(
                              text,
                              style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade200, width: 1), // Solid vertical left line
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1), // Solid horizontal bottom line
                    right: BorderSide.none,
                    top: BorderSide.none,
                  ),
                ),
                minX: 0,
                maxX: 5.2, // Allow lines to go slightly past 2020
                minY: 0,
                maxY: 50,
                lineBarsData: [
                  // Pink Spline Line (peach/coral color in original mockup)
                  LineChartBarData(
                    spots: const [
                      FlSpot(0.0, 32),
                      FlSpot(0.5, 38),
                      FlSpot(1.0, 25),
                      FlSpot(1.6, 10),
                      FlSpot(2.0, 15),
                      FlSpot(3.1, 42),
                      FlSpot(4.1, 10),
                      FlSpot(5.0, 49),
                      FlSpot(5.2, 28),
                    ],
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: const Color(0xFFE98C8C), // Matches the legend's pink/peach dot
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    shadow: const Shadow(
                      color: Color(0x3FE98C8C), // Glowing pink shadow
                      blurRadius: 10,
                      offset: Offset(0, 8),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFFE98C8C).withValues(alpha: 0.2),
                          const Color(0xFFE98C8C).withValues(alpha: 0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // Purple Spline Line
                  LineChartBarData(
                    spots: const [
                      FlSpot(0.0, 23),
                      FlSpot(1.0, 15),
                      FlSpot(2.0, 24),
                      FlSpot(3.0, 45),
                      FlSpot(4.0, 15),
                      FlSpot(5.0, 39),
                      FlSpot(5.2, 28),
                    ],
                    isCurved: true,
                    curveSmoothness: 0.35,
                    color: const Color(0xFF4318FF),
                    barWidth: 4,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    shadow: const Shadow(
                      color: Color(0x3F4318FF), // Glowing purple shadow
                      blurRadius: 10,
                      offset: Offset(0, 8),
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF4318FF).withValues(alpha: 0.25),
                          const Color(0xFF4318FF).withValues(alpha: 0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Highlight dot on the purple curve at 2018 (x=3.0, y=45)
            Positioned(
              left: leftOffset - 6,
              top: dotTop - 6,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF4318FF), width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4318FF).withValues(alpha: 0.3),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),

            // Permanent mockup tooltip positioned exactly above 2018
            Positioned(
              left: leftOffset - 35, // Centered horizontally above 2018
              top: dotTop - 65, // Positioned nicely above the dot
              child: Container(
                width: 70,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4318FF),
                      Color(0xFF5F35FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4318FF).withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '2023',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '•',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '55',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
