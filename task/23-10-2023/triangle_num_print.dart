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

