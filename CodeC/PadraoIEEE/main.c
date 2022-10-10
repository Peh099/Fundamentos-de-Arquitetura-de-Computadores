#include <stdio.h>

int main()
{
    float number;
    scanf("%f", &number);
    printf("%.8f\n", number);
    if (number > 0)
    {
        printf("+\n");
    }
    else
    {
        printf("-\n");
    }
    float number2;
    number2 = number - (int)number;
    //number2=number2/127;

    printf("%.8g", number2);

    return 0;
}