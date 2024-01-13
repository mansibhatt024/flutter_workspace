import 'package:flutter/material.dart';
import 'db.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? _selectedGender;
  List<String> _selectedHobbies = [];
  String? _selectedCity;
  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> hobbyOptions = ['Reading', 'Gaming', 'Traveling', 'Sports'];
  List<String> cityOptions = ['ahmedabad', 'rajkot', 'vadodara', 'surat', 'jamnagar', 'bhavanagar', 'dwarka'];
  late Mydb mydb = Mydb();

  @override
  void initState() {
    super.initState();
    mydb.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Details")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                ),
              ),
              TextField(
                controller: surname,
                decoration: InputDecoration(
                  hintText: "Enter Your Surname",
                ),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                ),
              ),
              Row(
                children: [
                  Text('Gender:'),
                  SizedBox(width: 16),
                  Row(
                    children: genderOptions
                        .map(
                          (option) => Row(
                        children: [
                          Radio<String>(
                            value: option,
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text(option),
                        ],
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
              if (_selectedGender == null)
                Text(
                  'Please select a gender',
                  style: TextStyle(color: Colors.red),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Hobbies:'),
                      SizedBox(width: 16),
                    ],
                  ),
                  Row(
                    children: hobbyOptions.sublist(0, hobbyOptions.length ~/ 2).map((option) {
                      return Row(
                        children: [
                          Checkbox(
                            value: _selectedHobbies.contains(option),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  if (value) {
                                    _selectedHobbies.add(option);
                                  } else {
                                    _selectedHobbies.remove(option);
                                  }
                                });
                              }
                            },
                          ),
                          Text(option),
                        ],
                      );
                    }).toList(),
                  ),
                  Row(
                    children: hobbyOptions.sublist(hobbyOptions.length ~/ 2).map((option) {
                      return Row(
                        children: [
                          Checkbox(
                            value: _selectedHobbies.contains(option),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  if (value) {
                                    _selectedHobbies.add(option);
                                  } else {
                                    _selectedHobbies.remove(option);
                                  }
                                });
                              }
                            },
                          ),
                          Text(option),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
              if (_selectedHobbies.isEmpty)
                Text(
                  'Please select at least one hobby',
                  style: TextStyle(color: Colors.red),
                ),
              DropdownButtonFormField<String>(
                value: _selectedCity,
                items: cityOptions.map((city) {
                  return DropdownMenuItem(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCity = value;
                  });
                },
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null) {
                    return 'Please select a city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password', hintText: "enter valid password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (!_isPasswordValid(value)) {
                    return 'Password must contain at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 6 characters long';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password', hintText: "enter confirm password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  mydb.db.rawInsert(
                    '''
                      INSERT INTO students (name, surname, email, gender, hobbies, city, password, confirm_password) 
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                    ''',
                    [
                      name.text.toString(),
                      surname.text.toString(),
                      email.text.toString(),
                      _selectedGender ?? '',
                      _selectedHobbies.join(', '), // Convert hobbies list to a string
                      _selectedCity ?? '',
                      _passwordController.text.toString(),
                      _confirmPasswordController.text.toString(),
                    ],
                  );
                },
                child: Text("Insert"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool _isPasswordValid(String value) {
  String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}
