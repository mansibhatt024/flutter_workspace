//9. Write a Program to show swap of two No's without using third variable.
import 'dart:io';

void main() {
  // Taking input from the user
  print("Enter the first number:");
  int num1 = int.parse(stdin.readLineSync()!);

  print("Enter the second number:");
  int num2 = int.parse(stdin.readLineSync()!);

  print("Before swapping: num1 = $num1, num2 = $num2");

  // Swapping using XOR bitwise operation
  num1 = num1 ^ num2;
  num2 = num1 ^ num2;
  num1 = num1 ^ num2;

  print("After swapping: num1 = $num1, num2 = $num2");
}



