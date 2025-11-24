import 'package:flutter/material.dart';
import 'utils/color_utils.dart';
import 'dashboard_screen.dart';
import 'calendar_screen.dart';

void main() {
  runApp(BandMateApp());
}

class BandMateApp extends StatelessWidget {
  const BandMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BandMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => DashboardScreen(),
        '/calendar': (context) => CalendarScreen(),
      },
    );
  }
}