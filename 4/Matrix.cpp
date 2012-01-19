
#include <cstdlib>
#define size 2048


int A [size][size];
int B [size][size];
int R [size][size];
 
int main ()
{
	srand (111);
	for (int i = 0; i < size; ++i)
	{
		for (int j = 0; j < size; ++j)
		{
			A[i][j] = rand();
			B[i][j] = rand();
			R[i][j] = 0;
		} 
	}
	

	for (int i = 0; i < size; ++i)
	{
		for (int j = 0; j < size; ++j)
		{
			for (int k=0; k < size; ++k)
			{
				R[i][j] += A[i][k] * B[k][j];
			}
		}
	}

	return 0;
}
