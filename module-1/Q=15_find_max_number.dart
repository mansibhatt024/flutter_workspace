//15. Write a program to find the Max number from the given three number using Nested  If
void main() {
int num1 = 100;
int num2 = 125;
int num3 = 185;

if (num1 >= num2) {
if (num1 >= num3) {
print('The maximum number is: $num1');
} else {
print('The maximum number is: $num3');
}
} else {
if (num2 >= num3) {
print('The maximum number is: $num2');
} else {
print('The maximum number is: $num3');
}
}
}
