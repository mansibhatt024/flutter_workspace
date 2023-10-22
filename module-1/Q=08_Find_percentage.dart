//8. Write a program to calculate sum of 5 subjects & find the percentage. Subject marks entered by user.
import 'dart:io';

void main(){
  // Initialize variables for marks and sum
  int totalMarks = 0;
  int numberOfSubjects = 5;
  // Read marks for each subject
  for (int i = 1; i <= numberOfSubjects; i++) {
    print("Enter marks for Subject $i: ");
    var input = stdin.readLineSync();
// Parse input and add to total marks
    var marks = int.parse(input!);
    totalMarks += marks;
    // Calculate percentage and display the result
    double percentage = (totalMarks / (numberOfSubjects * 100)) * 100;
    print("Total Marks: $totalMarks");
    print("Percentage: $percentage%");
  }
  }