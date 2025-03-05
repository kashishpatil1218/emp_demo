import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'attendance/attendance_page.dart';
import 'early leavers/eraly_leavers.dart';
import 'employyeList/employee.dart';
import 'late_comes/late_comes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Color(0xff73AB6B),
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Column(
                children: [
                  Container(
                    height: 79,
                    width: 79,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('asset/img/profile.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hello! MD. Sharafat",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child:ListView(
                children: [
                  buildDrawerItem(context, 'asset/img/attendance.png', "Attendance", AttendanceScreen()),
                  buildDrawerItem(context, 'asset/img/late_comes.png', "Late Comers", LateComersScreen()),
                  buildDrawerItem(context, 'asset/img/Book_open.png', "Early Leavers", EarlyLeaversScreen()),
                  buildDrawerItem(context, 'asset/img/leaves.png', "Leaves", EarlyLeaversScreen()),//TODO change page
                  buildDrawerItem(context, 'asset/img/issue report.png', "Issues Report", EarlyLeaversScreen()),//TODO change page
                  buildDrawerItem(context, 'asset/img/incident.png', "Incident Report", EarlyLeaversScreen()),//TODO change page
                  buildDrawerItem(context, 'asset/img/employye.png', "Employee List", EmployeeListScreen()),
                  buildDrawerItem(context, 'asset/img/logout.png', "Log out", EarlyLeaversScreen()),//TODO change page
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Text("Welcome to Dashboard")),
    );
  }

  Widget buildDrawerItem(BuildContext context,String img, String title,Widget page) {
    return ListTile(
      leading: Image.asset(img),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: Color(0xff414042), fontSize: 20),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page,));
      },
    );
  }
}
