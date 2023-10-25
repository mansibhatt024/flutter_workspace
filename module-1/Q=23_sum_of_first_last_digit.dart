//23. Write a program you have to make a summation of first and last Digit. (E.g. 1234 ans:-5)
import 'dart:io';

void main() {
  print("Enter a number:");
  var input = stdin.readLineSync();

  var number = int.parse(input!);
  var sum = calculateSumOfFirstAndLastDigit(number);
  print("Sum of first and last digits: $sum");
  {
    print("Invalid input. Please enter a valid number.");
  }
}

int calculateSumOfFirstAndLastDigit(int number) {
  if (number < 0) {
    number = -number; // Handle negative numbers
  }

  int lastDigit = number % 10;

  while (number >= 10) {
    number ~/= 10;
  }

  int firstDigit = number;
  return firstDigit + lastDigit;
}
