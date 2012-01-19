#include <cstdlib>
#define size 2048

int A [size*size];
int B [size*size];
int R [size*size];


int main ()
{
	int a = 16;
	int TS = a * a;
	int TC = size / a;
	
	srand (113);
	for (int i = 0; i < size * size; ++i)
	{
			A[i] = rand();
			B[i] = rand();
			R[i] = 0;
	}

	for (int i = 0; i < size; ++i)
	{
		int posi = (i / a) * (TS * TC) + a * (i % a);
		for (int j = 0; j < size; ++j)
		{
			int posj = (j / a) + TS + j % a;
			int pos = posi + posj;
			for (int k = 0; k < size; ++k)
			{
				R[pos] += A [ posi + (k/a) * TS + k % a] * B [( k / a) + (TS * TC)+ a * ( k % a ) + posj ];

			}
		}
	}
	return 0;
}
