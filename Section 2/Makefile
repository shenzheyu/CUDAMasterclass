common.o : ../Headers/common.cpp ../Headers/common.h 
	g++ -c ../Headers/common.cpp 

cuda_common.o : ../Headers/cuda_common.cu ../Headers/cuda_common.cuh 
	nvcc -c ../Headers/cuda_common.cu

3_warp_divergence.o : 3_warp_divergence.cu
	nvcc -c 3_warp_divergence.cu -I ../Headers -o 3_warp_divergence.o -G

3_warp_divergence : 3_warp_divergence.o cuda_common.o
	nvcc -o 3_warp_divergence 3_warp_divergence.o cuda_common.o