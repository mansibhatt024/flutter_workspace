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