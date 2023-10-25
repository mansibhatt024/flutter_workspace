//18. Write a Program of Addition, Subtraction ,Multiplication and Division using Switch  case.(Must Be Menu Driven)
import 'dart:io';

void main() {
  stdout.write('Enter first number: ');
  double num1 = double.parse(stdin.readLineSync()!);
  stdout.write('Enter second number: ');
  double num2 = double.parse(stdin.readLineSync()!);

  while (true) {
    print('Menu:');
    print('1. Addition');
    print('2. Subtraction');
    print('3. Multiplication');
    print('4. Division');
    print('5. Exit');
    stdout.write('Enter your choice: ');

    int choice = int.parse(stdin.readLineSync()!);

    double result = 0.0;

    switch (choice) {
      case 1:
        result = num1 + num2;
        print('Result: $result');
        break;
      case 2:
        result = num1 - num2;
        print('Result: $result');
        break;
      case 3:
        result = num1 * num2;
        print('Result: $result');
        break;
      case 4:
        if (num2 != 0) {
          result = num1 / num2;
          print('Result: $result');
        } else {
          print('Error: Division by zero is not allowed');
        }
        break;
      case 5:
        print('Exiting the program. Goodbye!');
        return;
      default:
        print('Invalid choice. Please enter a valid option.');
    }
  }
}
