import 'package:flutter/material.dart';
import 'package:module_4/view.dart';
import 'add data.dart';


void main() {
  runApp(MaterialApp(
    home: RegistrationForm(),
  ));
}


class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String? _selectedGender;
  List<String> _selectedHobbies = [];
  String? _selectedCity;

  List<String> genderOptions = ['Male', 'Female', 'Other'];
  List<String> hobbyOptions = ['Reading', 'Gaming', 'Traveling', 'Sports'];
  List<String> cityOptions = ['ahmedabad', 'rajkot', 'vadodara', 'surat', 'jamnagar', 'bhavanagar', 'dwarka'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: 'First Name', hintText: "enter your name"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name', hintText: "enter your surname"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email', hintText: "enter email "),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
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
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // Set button color
                      ),
                      onPressed: () {
                        final formState = _formKey.currentState;
                        if (formState != null &&
                            formState.validate() &&
                            _selectedGender != null &&
                            _selectedHobbies.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NextPage(
                                firstName: _firstNameController.text,
                                lastName: _lastNameController.text,
                                email: _emailController.text,
                                gender: _selectedGender!,
                                hobbies: _selectedHobbies,
                                city: _selectedCity!,
                                password: _passwordController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => AddData()));

                    }, child: Text("Add Student")),
                    ElevatedButton(onPressed: ()
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ViewData()));
                    }, child: Text("View Student")),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isPasswordValid(String value) {
    // Password must contain at least one uppercase letter, one lowercase letter,
    // one digit, one special character, and be at least 6 characters long
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}

class NextPage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final List<String> hobbies;
  final String city;
  final String password;

  NextPage({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.hobbies,
    required this.city,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details Page'),
          backgroundColor: Colors.deepOrange, // Set app bar color
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('First Name: $firstName'),
    Text('Last Name: $lastName'),
    Text('Email: $email'),
      Text('Gender: $gender'),
      Text('Hobbies: ${hobbies.join(', ')}'),
      Text('City: $city'),
      Text('Password: $password'),
    ],
    ),
        ),
    );
  }
}


