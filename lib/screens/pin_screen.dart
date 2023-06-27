import 'package:flutter/material.dart';
import 'package:photo_album_app/screens/dashboard_screen.dart';

class PinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  void _authenticate() {
    String enteredPin = _pinController.text;

    if (enteredPin == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incorrect PIN'),
            content: Text('Please enter the correct PIN to access the app.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PIN Screen'),
      ),
      body: Container(
        color: Color.fromARGB(255, 227, 152, 177),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _pinController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter PIN',
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Authenticate'),
                  onPressed: _authenticate,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
