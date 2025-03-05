import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeListScreen extends StatelessWidget {
  final List<String> employees = [
    "Faius Mojumder Nahin",
    "Md. Sharek",
    "Istiyak Milon",
    "Md. Rakibul Islam",
    "Md. Sorif",
    "Md. Mobusshar Islam",
    "Md. Ratul",
    "Md. Atik",
    "Tazib",
    "Joy Kibria",
    "Rajib Chowdhury",
    "Nazmul Hasan",
    "Saiful Islam",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff73AB6B),
        title: Text(
          "Employee List",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('asset/img/Menu.png'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                text: 'Total Employees:',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                children: [
                  TextSpan(
                    text: ' 25  ',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff73AB6B),
                      ),
                    ),
                  ),
                ],
              ),

            ),
          ),
          Divider(color: Colors.black38),
          Padding(
            padding: EdgeInsets.symmetric(horizontal:20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Name",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Text(
                    "Preview",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.black38),
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10,right:40),
                  child: ListTile(
                    title: Text(
                      employees[index],
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    trailing: Icon(Icons.remove_red_eye_outlined,color: Color(0xffB1B1B1),),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
