import 'package:flutter/material.dart';

import 'attendance/attendance_page.dart';
import 'drawer_page.dart';
import 'early leavers/eraly_leavers.dart';
import 'employyeList/employee.dart';
import 'late_comes/late_comes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=> LeaveRequestScreen(),
        '/attendance':(context)=> AttendanceScreen(),
        '/lateComers':(context)=> LateComersScreen(),
        '/earlyLeave':(context)=> EarlyLeaversScreen(),
        '/employeeList':(context)=> EmployeeListScreen(),
      }
    );
  }
}
