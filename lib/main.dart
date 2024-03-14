// main.dart

import 'package:flutter/material.dart';
import 'screens/singnUp.dart' ;// Import your SignInScreen.dart file
import 'screens/loginScreen.dart';// Import your LoginScreen.dart file

void main() {
  runApp(MyApp());
}
/////
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // Define the routes for your application
      routes: {
        '/': (context) => SignInScreen(), // Set SignInScreen as the default route
        '/login': (context) => LoginScreen(), // Route for login screen
        '/home': (context) => HomeScreen(), // Example route for home screen
        // Add more routes for other screens if needed
      },
    );
  }
}

// home_screen.dart





class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  bool _isButtonEnabled = false;
  String _selectedGender = '';

  @override
  void initState() {
    super.initState();
    _textFieldController1.addListener(_updateButtonState);
    _textFieldController2.addListener(_updateButtonState);
    _textFieldController3.addListener(_updateButtonState);
    _salaryController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _textFieldController1,
                decoration: InputDecoration(labelText: 'Field 1 (14 digits)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  if (value.length != 14 || int.tryParse(value) == null) {
                    return 'Field 1 must be 14 digits long and numeric';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _textFieldController2,
                decoration: InputDecoration(labelText: 'Field 2 (string only)'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // Add more conditions if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _textFieldController3,
                decoration: InputDecoration(labelText: 'Field 3 (string only)'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // Add more conditions if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(labelText: 'Salary'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  // Add more conditions if needed
                  return null;
                },
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Gender'),
              ),
              RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                groupValue: _selectedGender,
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isButtonEnabled ? _submitForm : null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    // Process the form data
    if (_formKey.currentState!.validate()) {
      // All conditions are met, process the data
      // For example, you can save the data to the database
      saveData();
    }
  }

  void saveData() {
    // Retrieve data from text fields
    String field1 = _textFieldController1.text;
    String field2 = _textFieldController2.text;
    String field3 = _textFieldController3.text;
    String salary = _salaryController.text;

    // Process the data (e.g., save to the database)
    // You can add your database logic here
    print('Field 1: $field1');
    print('Field 2: $field2');
    print('Field 3: $field3');
    print('Salary: $salary');
    print('Selected Gender: $_selectedGender');
  }
}

