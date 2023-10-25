//10. Write a Program to check the given number is Positive, Negative.
import 'dart:io';
void main() {
  // Take user input for the number
  print("Enter a number: ");
  var number = int.parse(stdin.readLineSync()!);

  // Check if the number is positive, negative, or zero
  if (number > 0) {
    print("The number is positive.");
  } else if (number < 0) {
    print("The number is negative.");
  } else {
    print("The number is zero.");
  }
}
