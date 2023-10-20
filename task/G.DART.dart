//g. Write a program to print the number in reverse order.
import 'dart:io';

void main(){
  print("enter number:");
  var input = stdin.readLineSync();
  var number = int.parse(input!);
  var reversedNumber = int.parse(input.split('').reversed.join());
  print("Number in reverse order: $reversedNumber");
}