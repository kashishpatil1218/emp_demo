import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LeaveRequestScreen extends StatefulWidget {
  @override
  _LeaveRequestScreenState createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  final TextEditingController _reasonController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  int _totalDays = 0;

  Future<void> _selectDate(BuildContext context, TextEditingController controller, {bool isStartDate = false}) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
        _calculateTotalDays();
      });
    }
  }

  void _calculateTotalDays() {
    if (_startDateController.text.isNotEmpty && _endDateController.text.isNotEmpty) {
      DateTime startDate = DateFormat('yyyy-MM-dd').parse(_startDateController.text);
      DateTime endDate = DateFormat('yyyy-MM-dd').parse(_endDateController.text);
      setState(() {
        _totalDays = endDate.difference(startDate).inDays + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Request", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apply for Leave", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 25),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(
                labelText: "Reason for leave",
                border: OutlineInputBorder(

                ),
              ),
            ),
            SizedBox(height: 25),
            TextField(

              controller: _startDateController,
              decoration: InputDecoration(


                labelText: "Start Date",

                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () => _selectDate(context, _startDateController, isStartDate: true),
            ),
            SizedBox(height: 25),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: "End Date",
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              onTap: () => _selectDate(context, _endDateController),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Total Days: $_totalDays",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_reasonController.text.isNotEmpty &&
                      _startDateController.text.isNotEmpty &&
                      _endDateController.text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Leave request submitted successfully!")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please complete all fields")),
                    );
                  }
                },
                child: Text("Submit", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}