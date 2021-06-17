#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <stdlib.h>
#include <cstring>
#include <time.h>

__global__ void unique_gid_calculation_3d_3d(int * data) {
    int tid = blockDim.x * blockDim.y * threadIdx.z + blockDim.x * threadIdx.y + threadIdx.x;

	int num_threads_in_a_block = blockDim.x * blockDim.y * blockDim.z;
	int block_offset = blockIdx.x * num_threads_in_a_block;

	int num_threads_in_a_row = num_threads_in_a_block * gridDim.x;
	int row_offset = num_threads_in_a_row * blockIdx.y;

    int num_threads_in_a_column = num_threads_in_a_row * gridDim.y;
    int column_offset = num_threads_in_a_column * blockIdx.z;

	int gid = tid + block_offset + row_offset + column_offset;

	printf("blockIdx.x : %d, blockIdx.y : %d, blockIdx.z : %d, threadIdx.x : %d, gid : %d - data : %d \n",
		blockIdx.x, blockIdx.y, blockIdx.z, tid, gid, data[gid]);
}

int main() {
	int size = 64;
	int byte_size = size * sizeof(int);

	int * h_input;
	h_input = (int*)malloc(byte_size);

	time_t t;
	srand((unsigned)time(&t));
	for (int i = 0; i < size; i++)
	{
		h_input[i] = (int)(rand() & 0xff);
	}

	int * d_input;
	cudaMalloc((void**)&d_input, byte_size);

	cudaMemcpy(d_input,h_input,byte_size,cudaMemcpyHostToDevice);

	dim3 block(2, 2, 2);
	dim3 grid(2, 2, 2);

	unique_gid_calculation_3d_3d<<<grid, block>>>(d_input);
	cudaDeviceSynchronize();

	cudaFree(d_input);
	free(h_input);

	cudaDeviceReset();
	return 0;
}