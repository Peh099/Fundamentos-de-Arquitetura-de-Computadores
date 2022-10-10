#include <stdio.h>

int main()
{
  char palavra[] = "THUMS THUMS THUMS";
  char palavra2[] = "THUMS THUMS THUMS THUMS THUMS THUMS";
  int number = 0;
  scanf("%d", &number);
  for (int i = 1; i <= number; i++)
  {
    if (i % 2 == 0)
    {
      printf("%s\n", palavra2);
    }
    else
    {
      printf("%s\n", palavra);
    }
  }

  return 0;
}