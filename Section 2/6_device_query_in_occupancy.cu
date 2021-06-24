#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void occupany_test(int *results) {
	int gid = blockDim.x * blockIdx.x + threadIdx.x;

	int x1 = 1;
	int x2 = 2;
	int x3 = 3;
	int x4 = 4;
	int x5 = 5;
	int x6 = 6;
	int x7 = 7;
	int x8 = 8;

	results[gid] = x1 + x2 + x3 + x4 + x5 + x6 + x7 +x8;
}

int main()
{
	int iDev = 0;
	cudaDeviceProp iProp;

	cudaGetDeviceProperties(&iProp, iDev);
	printf("Max threads per SM : %d \n",
		iProp.maxThreadsPerMultiProcessor);

	return 0;
}