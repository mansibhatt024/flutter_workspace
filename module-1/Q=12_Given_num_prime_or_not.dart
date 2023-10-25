//12. Write a Program to check the given number is prime or not prime.
import 'dart:io';

void main() {
  print("Enter a number:");
  int num = int.parse(stdin.readLineSync()!);

  if (isPrime(num)) {
    print("$num is a prime number.");
  } else {
    print("$num is not a prime number.");
  }
}

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i*i <= number; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}
