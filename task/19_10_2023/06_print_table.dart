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
