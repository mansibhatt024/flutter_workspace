//16. Write a program user enter the 5 subjects mark. You have to make a total and find the percentage. percentage > 75 you have to print “Distinction” percentage > 60 and percentage <= 75 you have to print “First class” percentage >50 and percentage <= 60 you have to print “Second class” percentage > 35 and percentage <= 50 you have to print “Pass class” Otherwise print “Fail”
import 'dart:io';

void main() {
  // Taking input for 5 subjects marks
  print('Enter marks for 5 subjects:');
  int totalMarks = 500;
  int obtainedMarks = 0;

  for (int i = 1; i <= 5; i++) {
    stdout.write('Enter marks for subject $i: ');
    int marks = int.parse(stdin.readLineSync()!);
    obtainedMarks += marks;
  }

  // Calculating percentage
  double percentage = (obtainedMarks / totalMarks) * 100;

  // Determining class based on percentage
  if (percentage > 75) {
    print('Distinction');
  } else if (percentage > 60) {
    print('First class');
  } else if (percentage > 50) {
    print('Second class');
  } else if (percentage > 35) {
    print('Pass class');
  } else {
    print('Fail');
  }
}
