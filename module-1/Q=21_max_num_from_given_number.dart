//21 .Write a program to find out the max from given number (E.g. No: -1562 Max number is 6 )
import 'dart:io';

void main() {
  print("Enter a number:");
  var input = stdin.readLineSync();
  var number = int.parse(input!);
  var maxDigit = findMaxDigit(number);
  print("Max number is: $maxDigit");
}

int findMaxDigit(int number) {
  int maxDigit = 0;
  while (number != 0) {
    int digit = number % 10;
    maxDigit = digit > maxDigit ? digit : maxDigit;
    number ~/= 10;
  }
  return maxDigit;
}
