#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int GERADOR = 0x00008005;
int MASK = 0x00008000;

int main()
{
  /*
   d = (uint8_t) *(data+contador);
	 s = d ^ (c >> 8);
	 p = s ^ (s >> 4);
	 p = p ^ (p >> 2);
	 p = p ^ (p >> 1);
	 p = p & 1;
	 t = p | (s << 1);
	 r = (c << 8)^(t << 15)^t^(t << 1);
	 c=r;
   */

  unsigned char string[] = "Alo mundo";

  int tamanho = strlen(string);

  int crc = 0x00000000;

  for (int i = 0; i < tamanho; i++)
  {

    crc ^= (int)((string[i] << 8) & 0x0000FFFF);
    //crc=$v7
    //string[i]<<8 == 


    for (int j = 0; j < 8; j++)
    {

      if ((crc & MASK) == MASK)
      {

        crc <<= 1;
        //crc= CRC<<1
        crc = crc ^ GERADOR;
      }
      else
      {

        crc <<= 1;
      }

      crc &= 0x0000FFFF;
    }
  }

  printf("0x%x\n", crc);
}