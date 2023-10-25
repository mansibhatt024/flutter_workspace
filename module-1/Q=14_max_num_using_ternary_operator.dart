//14. Write a program to find the Max number from the given three number using Ternary Operator
void main() {
  int num1 = 10;
  int num2 = 20;
  int num3 = 15;

  // Using ternary operator to find the maximum number
  int maxNumber = (num1 > num2) ? ((num1 > num3) ? num1 : num3) : ((num2 > num3) ? num2 : num3);

  print('Maximum number among $num1, $num2, and $num3 is: $maxNumber');
}
