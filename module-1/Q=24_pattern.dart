//*
//**
//***
//****
//*****
import 'dart:io';

void main(){
  int i,j;
  for(i=0;i<=5;i++) {
    for(j=0;j<=i;j++){
      stdout.write("*");
    }
    print("");
  }
}
//1
//12
//123
//1234
//12345
import 'dart:io';

void main(){
  int i,j;
  for(i=1;i<=5;i++) {
    for(j=1;j<=i;j++){
      stdout.write("$j");
    }
    print("");
  }
}
//1
//22
//333
//4444
//55555
import 'dart:io';

void main(){
  int i,j;
  for(i=1;i<=5;i++) {
    for(j=1;j<=i;j++){
      stdout.write("$i");
    }
    print("");
  }
}
//     *
//    **
//   ***
//  ****
// *****
import 'dart:io';

void main()
{
  int i,j,space,num;

  print("Enter Any Number");
  num = int.parse(stdin.readLineSync()!);

  for(i=1;i<=num;i++)//row
      {
    for(space=0;space!=(num-i);space++)
    {
      stdout.write(" ");
    }
    for(j=1;j<=i;j++)//col
        {
      stdout.write("*");
    }
    print("");

  }

}
//         1
//       2 1
//     3 2 1
//   4 3 2 1
// 5 4 3 2 1
import 'dart:io';

void main()
{
  int i,j,space,num;

  print("Enter Any Number");
  num = int.parse(stdin.readLineSync()!);

  for(i=1;i<=num;i++)//row
      {
    for(space=0;space!=(num-i);space++)
    {
      stdout.write(" ");
    }
    for(j=i;j>=1;j--)//col
        {
      stdout.write("$j");
    }
    print(" ");

  }

}
//     *
//    * *
//   * * *
//  * * * *
// * * * * *
import 'dart:io';

void main() {
  int i, j, k,num;
  print("Enter Any Number");
  num = int.parse(stdin.readLineSync()!);

  for(i=1;i<=num;i++)//row
      {
    for(k=0;k!=(num-i);k++)
    {
      stdout.write(" ");
    }
    for(j=1;j<=i;j++)//col
        {
      stdout.write("* ");
    }
    print(" ");

  }
}

//      1
//     1 2
//    1 2 3
//   1 2 3 4
//  1 2 3 4 5
import 'dart:io';

void main() {
  int i, j, k,num;
  print("Enter Any Number");
  num = int.parse(stdin.readLineSync()!);

  for(i=1;i<=num;i++)//row
      {
    for(k=0;k!=(num-i);k++)
    {
      stdout.write(" ");
    }
    for(j=1;j<=i;j++)//col
        {
      stdout.write("$j ");
    }
    print(" ");

  }
}

//     1
//    2 2
//   3 3 3
//  4 4 4 4
// 5 5 5 5 5
import 'dart:io';

void main() {
  int i, j, k,num;
  print("Enter Any Number");
  num = int.parse(stdin.readLineSync()!);

  for(i=1;i<=num;i++)//row
      {
    for(k=0;k!=(num-i);k++)
    {
      stdout.write(" ");
    }
    for(j=1;j<=i;j++)//col
        {
      stdout.write("$i ");
    }
    print(" ");

  }
}

//1
//2 3
//4 5 6
//7 8 9 10
//11 12 13 14 15
import 'dart:io';

void main(){
  int i,j,count=1;
  for(i=1;i<=5;i++) {
    for (j = 1; j <= i; j++) {
      stdout.write(count );
      count++;
    }
    print("");
  }
}
//1
//1 0
//1 0 1
//1 0 1 0
//1 0 1 0 1

import 'dart:io';

void main() {
  int i, j, num;
  print("Enter Any Number");
  num = int.parse(stdin.readLineSync()!);

  for (i = 1; i <= num; i++) {
    for (j = 1; j <= i; j++) {
      if (j % 2 == 0) {
        stdout.write("0 ");
      } else {
        stdout.write("1 ");
      }
    }
    print("");
  }
}
//1
//4 4
//9 9 9
//16 16 16 16
//25 25 25 25 25
import 'dart:io';

void main(){
  int i,j;
  for(i=1;i<=5;i++) {
    for(j=1;j<=i;j++){
      stdout.write("${i * i}  ");
    }
    print("");
  }
}