#include <stdio.h>

int main()
{
  int num, cont = 0;
  printf("Entre com um numero: ");
  scanf(" %d", &num);

  for (int i = 1; i <= num; i++)
  {
    if (num % i == 0)
      cont++;
  }

  if (num <= 0)
  {
    printf("Numero invalido");
    return 0;
  }
  if (cont == 2)
    printf("O numero %d e primo", num);
  else
    printf("O numero %d nao e primo", num);

  return 0;
}