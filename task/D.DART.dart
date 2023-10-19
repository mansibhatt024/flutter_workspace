//d .write a program you have to find the factorial of given number.
import 'dart:io';

void main()
{
  print("enter a number");
  int number = int.parse(stdin.readLineSync()!);
  int factorial=1;
  for (int i = 1; i <= number; i++) {
    factorial *= i;
  }

  print("Factorial of $number is: $factorial");
}
