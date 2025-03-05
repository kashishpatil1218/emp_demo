import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      color: Colors.black,
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
              child: ListView(
                children: [
                  buildDrawerItem('asset/img/attendance.png', "Attendance"),
                  buildDrawerItem('asset/img/late_comes.png', "Late Comers"),
                  buildDrawerItem('asset/img/Book_open.png', "Early Leavers"),
                  buildDrawerItem('asset/img/leaves.png', "Leaves"),
                  buildDrawerItem(
                    'asset/img/issue report.png',
                    "Issues Report",
                  ),
                  buildDrawerItem('asset/img/incident.png', "Incident Report"),
                  buildDrawerItem('asset/img/employye.png', "Employee List"),

                  buildDrawerItem('asset/img/logout.png', "Log out"),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(child: Text("Welcome to Dashboard")),
    );
  }

  Widget buildDrawerItem(String img, String title) {
    return ListTile(
      leading: Image.asset(img),
      title: Text(
        title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(color: Color(0xff414042), fontSize: 20),
        ),
      ),
      onTap: () {},
    );
  }
}
