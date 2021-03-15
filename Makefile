NVCC=nvcc
NVCCFLAGS=-std=c++11 -arch=sm_70
TARGET=kernel-overhead.test

$(TARGET):src/main.cu
	$(NVCC) $< $(NVCCFLAGS) -o $@

clean:
	rm -f $(TARGET)
