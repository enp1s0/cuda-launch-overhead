#include <iostream>
#include <chrono>
#include <thread>

template <unsigned n_ops>
__global__ void kernel(float* const ptr) {
	const unsigned tid = threadIdx.x + blockIdx.x * blockDim.x;

	auto v = ptr[tid];

	for (unsigned i = 0; i < n_ops; i++) {
		v += 1.0f;
	}

	ptr[tid] = v;
}

void measure_launch_overhead(const unsigned grid_size) {
	constexpr unsigned block_size = 1024;
	const auto array_length = block_size * grid_size;

	constexpr unsigned num_ops_A = 1u << 15;
	constexpr unsigned num_ops_B = num_ops_A + (1u << 20);

	float *ha, *da_A, *da_B;
	cudaMallocHost(&ha  , sizeof(float) * array_length);
	cudaMalloc    (&da_A, sizeof(float) * array_length);
	cudaMalloc    (&da_B, sizeof(float) * array_length);

	// init array
	for (unsigned i = 0; i < grid_size * block_size; i++) {
		ha[i] = static_cast<float>(i);
	}
	cudaMemcpy(da_A, ha, sizeof(float) * array_length, cudaMemcpyDefault);
	cudaMemcpy(da_B, ha, sizeof(float) * array_length, cudaMemcpyDefault);

	// measure elapsed time of A ops
	const auto start_A = std::chrono::high_resolution_clock::now();
	kernel<num_ops_A><<<grid_size, block_size>>>(da_A);
	cudaDeviceSynchronize();
	const auto end_A = std::chrono::high_resolution_clock::now();
	const auto time_A = std::chrono::duration_cast<std::chrono::nanoseconds>(end_A - start_A).count();

	// Sleep 2000ms to cool GPU
	using namespace std::chrono_literals;
	std::this_thread::sleep_for(2000ms);

	// measure elapsed time of B ops
	const auto start_B = std::chrono::high_resolution_clock::now();
	kernel<num_ops_B><<<grid_size, block_size>>>(da_B);
	cudaDeviceSynchronize();
	const auto end_B = std::chrono::high_resolution_clock::now();
	const auto time_B = std::chrono::duration_cast<std::chrono::nanoseconds>(end_B - start_B).count();

	const auto time_diff = time_B - time_A;

	std::printf("[GridSize = %8u, BlockSize = %3u] ", grid_size, block_size);
	std::printf("elapsed time A : %15lu [ns], elapsed time B : %15lu [ns], time/op : %e [ns], launch overhead : %7lu [ns]\n",
			time_A,
			time_B,
			static_cast<double>(time_diff) / (num_ops_B - num_ops_A),
			time_A - time_diff * num_ops_A / (num_ops_B - num_ops_A));

	cudaFree    (da_A);
	cudaFree    (da_B);
	cudaFreeHost(ha);
}

int main() {
	for (unsigned i = 0; i < 20; i++) {
		measure_launch_overhead(1u << i);
	}
}
