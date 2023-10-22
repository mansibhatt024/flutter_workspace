//7. Write a program to convert temperature from degree centigrade to Fahrenheit.
import 'dart:io';

void main() {
  print("Enter temperature in Celsius:");
  var input = stdin.readLineSync();
    var celsius = double.parse(input!);
    var fahrenheit = (celsius * 9/5) + 32;
    print("Temperature in Fahrenheit: $fahrenheit °F");
     
  }
