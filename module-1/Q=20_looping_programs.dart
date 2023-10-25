//a. Write a program to print the 1 to 10 using For loop.
void main() {
  for (int i = 1; i <= 10; i++) {
    print(i);
  }
}
//b. Write a Program to print the 51 to 60 using while loop
void main(){
  int a;
  a=51;
  while(a<=60)
  {
    print(a);
    a++;
  }
}
//c. write a program to print the 100 to 81 using do....while loop
void main(){
  int i=100;
  do{
    print(i);
    i--;
  }while(i>=81);
}
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
//e. Write a program you have to print the Fibonacci series up to user given number
import 'dart:io';

void main(){
  print("enter the number of fibonacci series");
  int n=int.parse(stdin.readLineSync()!);
  int first=0;
  int second=1;
  print("fibonacci series:");
  for(int i=0;i<=10;i++)
  {
    print(first);
    int next=first+second;
    first=second;
    second=next;
  }

}
//f. write a program you have to print the table of given number.
import 'dart:io';

void main(){
  print("enter number");
  var number = int.tryParse(stdin.readLineSync()!);

  if (number != null) {
    for (var i = 1; i <= 10; i++) {
      print("$number x $i = ${number * i}");
    }
  } else {
    print("Invalid input. Please enter a valid number.");
  }
}
//g. Write a program to print the number in reverse order.
import 'dart:io';

void main() {
  stdout.write('Enter a number: ');
  int number = int.parse(stdin.readLineSync()!);

  int reversedNumber = 0;

  while (number > 0) {
    int digit = number % 10;
    reversedNumber = reversedNumber * 10 + digit;
    number = number ~/ 10;
  }

  print('Number in reverse order: $reversedNumber');
}
