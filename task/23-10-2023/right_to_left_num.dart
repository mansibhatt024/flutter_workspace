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