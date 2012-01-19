#include <stdio.h>

	void icos (double, int);
	
	extern void print (double a)
	{
		printf("%lf",a);
	}


int main ()
{
	icos(1.23,13);// 13*cos(1.23);
	return 0;
}
