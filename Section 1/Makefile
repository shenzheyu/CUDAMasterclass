common.o : ../Headers/common.cpp ../Headers/common.h 
	g++ -c ../Headers/common.cpp 

cuda_common.o : ../Headers/cuda_common.cu ../Headers/cuda_common.cuh 
	nvcc -c ../Headers/cuda_common.cu

14_sum_array.o : 14_sum_array.cu
	nvcc -c 14_sum_array.cu -I ../Headers -o 14_sum_array.o

14_sum_array : 14_sum_array.o cuda_common.o common.o 
	nvcc -o 14_sum_array 14_sum_array.o common.o cuda_common.o
	