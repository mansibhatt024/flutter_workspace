//22. Write a program make a summation of given number(E.g. 1523 ans :-11)

import 'dart:io';

int calculateSum(int number) {
  int sum = 0;
  while (number != 0) {
    int digit = number % 10;
    sum += digit;
    number ~/= 10;
  }
  return sum;
}

void main() {
  print("Enter a number:");
  var input = stdin.readLineSync();
  var number = int.tryParse(input!);

  if (number != null) {
    var sum = calculateSum(number);
    print("Sum of the digits: $sum");
  } else {
    print("Invalid input. Please enter a valid number.");
  }
}
