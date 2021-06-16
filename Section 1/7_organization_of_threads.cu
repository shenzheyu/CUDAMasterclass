#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void print_details()
{
	printf("blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, gridDim.x : %d, gridDim.y :%d, gridDim.z :%d \n",
		blockIdx.x, blockIdx.y, blockIdx.z, blockIdx.x, blockIdx.y, blockIdx.z, gridDim.x, gridDim.y, gridDim.z);
}

int main()
{
	dim3 block(4, 4, 4);
	dim3 grid(2, 2, 2);

	print_details << <grid, block >> > ();
	cudaDeviceSynchronize();

	cudaDeviceReset();
	return 0;
}
