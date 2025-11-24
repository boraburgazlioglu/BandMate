import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils/color_utils.dart';
import 'utils/text_utils.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  // setting default to week view
  var _fmt = CalendarFormat.week;
  var _focused = DateTime.now();
  DateTime? _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Calendar", style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // spacing
          Center(
            child: Container(
              // making it look like a card
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2024, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  
                  focusedDay: _focused,
                  calendarFormat: _fmt,
                  
                  selectedDayPredicate: (d) {
                    return isSameDay(_selected, d);
                  },
                  
                  onDaySelected: (sel, foc) {
                    // print("clicked ${sel.day}");
                    setState(() {
                      _selected = sel;
                      _focused = foc;
                    });
                  },
                  
                  onFormatChanged: (f) {
                    setState(() {
                      _fmt = f;
                    });
                  },

                  // styles
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    titleTextStyle: AppTextStyles.headingSmall,
                    formatButtonVisible: true, 
                    leftChevronIcon: Icon(Icons.chevron_left, color: AppColors.primary),
                    rightChevronIcon: Icon(Icons.chevron_right, color: AppColors.primary),
                  ),
                  
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(color: AppColors.text),
                    weekendTextStyle: TextStyle(color: AppColors.textSecondary),
                    
                    // colors
                    todayDecoration: BoxDecoration(
                      color: AppColors.primaryLight, 
                      shape: BoxShape.circle
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppColors.button, 
                      shape: BoxShape.circle
                    ),
                    selectedTextStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}