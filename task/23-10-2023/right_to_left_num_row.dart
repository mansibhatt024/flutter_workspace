//        1
//      2 2
//    3 3 3
//  4 4 4 4
//5 5 5 5 5
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
      stdout.write("$i");
    }
    print(" ");

  }

}