void main() {
  int subject1 = 80;
  int subject2 = 85;
  int subject3 = 90;
  int subject4 = 88;
  int subject5 = 92;

  int totalMarks = subject1 + subject2 + subject3 + subject4 + subject5;
  double percentage = (totalMarks / 500) * 100;

  print('Total marks obtained: $totalMarks');
  print('Percentage: $percentage%');
}
