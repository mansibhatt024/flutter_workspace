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

