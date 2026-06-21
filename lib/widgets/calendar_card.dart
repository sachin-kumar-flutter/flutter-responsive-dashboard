import 'package:flutter/material.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Days grid for the mock calendar (October 2023) - matches mockup layout exactly (no October 31st)
    final List<Map<String, dynamic>> calendarDays = [
      // September days (grey)
      {'day': 29, 'isCurrentMonth': false},
      {'day': 30, 'isCurrentMonth': false},
      {'day': 31, 'isCurrentMonth': false},
      // October days
      {'day': 1, 'isCurrentMonth': true, 'isDefaultSelected': true}, // Day 1 circular highlight
      {'day': 2, 'isCurrentMonth': true},
      {'day': 3, 'isCurrentMonth': true},
      {'day': 4, 'isCurrentMonth': true},
      {'day': 5, 'isCurrentMonth': true},
      {'day': 6, 'isCurrentMonth': true},
      {'day': 7, 'isCurrentMonth': true},
      {'day': 8, 'isCurrentMonth': true},
      {'day': 9, 'isCurrentMonth': true},
      {'day': 10, 'isCurrentMonth': true},
      {'day': 11, 'isCurrentMonth': true},
      {'day': 12, 'isCurrentMonth': true},
      {'day': 13, 'isCurrentMonth': true},
      {'day': 14, 'isCurrentMonth': true},
      {'day': 15, 'isCurrentMonth': true},
      {'day': 16, 'isCurrentMonth': true},
      {'day': 17, 'isCurrentMonth': true},
      {'day': 18, 'isCurrentMonth': true},
      {'day': 19, 'isCurrentMonth': true},
      {'day': 20, 'isCurrentMonth': true},
      {'day': 21, 'isCurrentMonth': true},
      {'day': 22, 'isCurrentMonth': true},
      {'day': 23, 'isCurrentMonth': true},
      {'day': 24, 'isCurrentMonth': true},
      {'day': 25, 'isCurrentMonth': true},
      {'day': 26, 'isCurrentMonth': true},
      {'day': 27, 'isCurrentMonth': true, 'highlightType': 'start'}, // Start of range
      {'day': 28, 'isCurrentMonth': true, 'highlightType': 'middle'}, // In-between
      {'day': 29, 'isCurrentMonth': true, 'highlightType': 'middle'}, // In-between
      {'day': 30, 'isCurrentMonth': true, 'highlightType': 'end'}, // End of range
      // November days (grey)
      {'day': 1, 'isCurrentMonth': false},
      {'day': 2, 'isCurrentMonth': false},
      {'day': 3, 'isCurrentMonth': false},
      {'day': 4, 'isCurrentMonth': false},
      {'day': 5, 'isCurrentMonth': false},
      {'day': 6, 'isCurrentMonth': false},
      {'day': 7, 'isCurrentMonth': false},
      {'day': 8, 'isCurrentMonth': false},
      {'day': 9, 'isCurrentMonth': false},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30), // Rounded corners matching mockup
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header with Month and Year Selectors
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Month select (rounded lavender-blue container with purple text/arrow)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFECEFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  children: [
                    Text(
                      'OCT',
                      style: TextStyle(
                        color: Color(0xFF4318FF), // Purple text
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF4318FF)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Year select (plain text + arrow)
              const Row(
                children: [
                  Text(
                    '2023',
                    style: TextStyle(
                      color: Color(0xFF707EAE),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.keyboard_arrow_down, size: 16, color: Color(0xFF707EAE)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Days of Week Header (Mo, Tu, We, Th, Fri, Sa, Su in bold indigo/navy)
          const Row(
            children: [
              Expanded(child: _WeekdayHeader('Mo')),
              Expanded(child: _WeekdayHeader('Tu')),
              Expanded(child: _WeekdayHeader('We')),
              Expanded(child: _WeekdayHeader('Th')),
              Expanded(child: _WeekdayHeader('Fri')),
              Expanded(child: _WeekdayHeader('Sa')),
              Expanded(child: _WeekdayHeader('Su')),
            ],
          ),
          const SizedBox(height: 16),

          // Days Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8, // Row vertical gap
              crossAxisSpacing: 0, // Zero horizontal spacing to connect highlight capsules
              childAspectRatio: 1.1, // Aspect ratio to ensure cells are slightly wider than tall
            ),
            itemCount: calendarDays.length,
            itemBuilder: (context, index) {
              final item = calendarDays[index];
              final int day = item['day'];
              final bool isCurrentMonth = item['isCurrentMonth'];
              final bool isDefaultSelected = item['isDefaultSelected'] ?? false;
              final String? highlightType = item['highlightType'];

              // Default selected (Day 1 circle highlight)
              if (isDefaultSelected) {
                return Center(
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF4F7FE), // Light grey circle
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      day.toString(),
                      style: const TextStyle(
                        color: Color(0xFF2B3674),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }

              // Selected Start & End range days (Days 27 & 30: Solid blue/purple circle)
              final bool isStartOrEnd = highlightType == 'start' || highlightType == 'end';
              if (isStartOrEnd) {
                return Center(
                  child: Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF4318FF), // Vibrant blue/purple
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      day.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }

              // Selected Middle range days (Days 28 & 29: Purple text, no background)
              final bool isMiddle = highlightType == 'middle';
              if (isMiddle) {
                return Center(
                  child: Text(
                    day.toString(),
                    style: const TextStyle(
                      color: Color(0xFF4318FF), // Purple text
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }

              // Standard day (not highlighted)
              return Center(
                child: Text(
                  day.toString(),
                  style: TextStyle(
                    color: isCurrentMonth ? const Color(0xFF2B3674) : const Color(0xFFB0BBD5),
                    fontSize: 13,
                    fontWeight: isCurrentMonth ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _WeekdayHeader extends StatelessWidget {
  final String text;
  const _WeekdayHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF2B3674), // Navy text matching mockup
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
