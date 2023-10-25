//19. Write a program of to find out the Area of Triangle, Rectangle and Circle using If Condition.(Must Be Menu Driven)
import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    print('Menu:');
    print('1. Calculate Area of Triangle');
    print('2. Calculate Area of Rectangle');
    print('3. Calculate Area of Circle');
    print('4. Exit');
    stdout.write('Enter your choice: ');

    int choice = int.parse(stdin.readLineSync()!);

    double area = 0.0;

    if (choice == 1) {
      // Calculate Area of Triangle
      stdout.write('Enter base length of the triangle: ');
      double base = double.parse(stdin.readLineSync()!);
      stdout.write('Enter height of the triangle: ');
      double height = double.parse(stdin.readLineSync()!);
      area = 0.5 * base * height;
    } else if (choice == 2) {
      // Calculate Area of Rectangle
      stdout.write('Enter length of the rectangle: ');
      double length = double.parse(stdin.readLineSync()!);
      stdout.write('Enter width of the rectangle: ');
      double width = double.parse(stdin.readLineSync()!);
      area = length * width;
    } else if (choice == 3) {
      // Calculate Area of Circle
      stdout.write('Enter radius of the circle: ');
      double radius = double.parse(stdin.readLineSync()!);
      area = pi * pow(radius, 2);
    } else if (choice == 4) {
      // Exit the program
      print('Exiting the program. Goodbye!');
      return;
    } else {
      // Invalid choice
      print('Invalid choice. Please enter a valid option.');
      continue;
    }

    print('Area: $area');
  }
}
