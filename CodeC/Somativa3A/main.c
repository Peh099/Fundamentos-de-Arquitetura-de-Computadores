#include <stdio.h>

int main()
{
  char number[100];
  int i = 0;
  while (scanf("%c", &number[i]) != EOF)
  {
    if (number[i] > 64 && number[i] != '-' && number[i] != '\n')
    {
      if (number[i] >= 64 && number[i] <= 67)
      {
        number[i] = '2';
      }
      else if (number[i] > 67 && number[i] <= 70)
      {
        number[i] = '3';
      }
      else if (number[i] > 70 && number[i] <= 73)
      {
        number[i] = '4';
      }
      else if (number[i] > 73 && number[i] <= 76)
      {
        number[i] = '5';
      }
      else if (number[i] > 76 && number[i] <= 79)
      {
        number[i] = '6';
      }
      else if (number[i] > 79 && number[i] <= 83)
      {
        number[i] = '7';
      }
      else if (number[i] > 83 && number[i] <= 86)
      {
        number[i] = '8';
      }
      else if (number[i] > 86 && number[i] <= 89)
      {
        number[i] = '9';
      }
    }
    i++;
  }
  for (int j = 0; j < i; j++)
  {
    printf("%c", number[j]);
  }
  printf("\n");
  return 0;
}