# CUDA kernel function launch overfead

## Build
```bash
git clone https://github.com/enp1s0/cuda-launch-overhead
cd cuda-launch-overhead
make
```

## Result
![result](./result.png)

```
[GridSize =        1, BlockSize = 256] elapsed time A :      105 [ns], elapsed time B :     3038 [ns], time/op : 2.797127e-03 [ns], launch overhead :  14 [ns]
[GridSize =        2, BlockSize = 256] elapsed time A :       99 [ns], elapsed time B :     3048 [ns], time/op : 2.812386e-03 [ns], launch overhead :   7 [ns]
[GridSize =        4, BlockSize = 256] elapsed time A :      100 [ns], elapsed time B :     3038 [ns], time/op : 2.801895e-03 [ns], launch overhead :   9 [ns]
[GridSize =        8, BlockSize = 256] elapsed time A :      100 [ns], elapsed time B :     3037 [ns], time/op : 2.800941e-03 [ns], launch overhead :   9 [ns]
[GridSize =       16, BlockSize = 256] elapsed time A :      100 [ns], elapsed time B :     3038 [ns], time/op : 2.801895e-03 [ns], launch overhead :   9 [ns]
[GridSize =       32, BlockSize = 256] elapsed time A :      100 [ns], elapsed time B :     3038 [ns], time/op : 2.801895e-03 [ns], launch overhead :   9 [ns]
[GridSize =       64, BlockSize = 256] elapsed time A :      101 [ns], elapsed time B :     3038 [ns], time/op : 2.800941e-03 [ns], launch overhead :  10 [ns]
[GridSize =      128, BlockSize = 256] elapsed time A :      103 [ns], elapsed time B :     3108 [ns], time/op : 2.865791e-03 [ns], launch overhead :  10 [ns]
[GridSize =      256, BlockSize = 256] elapsed time A :      196 [ns], elapsed time B :     6201 [ns], time/op : 5.726814e-03 [ns], launch overhead :   9 [ns]
[GridSize =      512, BlockSize = 256] elapsed time A :      399 [ns], elapsed time B :    12351 [ns], time/op : 1.139832e-02 [ns], launch overhead :  26 [ns]
[GridSize =     1024, BlockSize = 256] elapsed time A :      756 [ns], elapsed time B :    24639 [ns], time/op : 2.277660e-02 [ns], launch overhead :  10 [ns]
[GridSize =     2048, BlockSize = 256] elapsed time A :     1469 [ns], elapsed time B :    48169 [ns], time/op : 4.453659e-02 [ns], launch overhead :  10 [ns]
[GridSize =     4096, BlockSize = 256] elapsed time A :     2846 [ns], elapsed time B :    93580 [ns], time/op : 8.653069e-02 [ns], launch overhead :  11 [ns]
[GridSize =     8192, BlockSize = 256] elapsed time A :     5611 [ns], elapsed time B :   184660 [ns], time/op : 1.707544e-01 [ns], launch overhead :  16 [ns]
[GridSize =    16384, BlockSize = 256] elapsed time A :    11141 [ns], elapsed time B :   366986 [ns], time/op : 3.393602e-01 [ns], launch overhead :  21 [ns]
[GridSize =    32768, BlockSize = 256] elapsed time A :    22245 [ns], elapsed time B :   733195 [ns], time/op : 6.780148e-01 [ns], launch overhead :  28 [ns]
[GridSize =    65536, BlockSize = 256] elapsed time A :    44448 [ns], elapsed time B :  1465589 [ns], time/op : 1.355306e+00 [ns], launch overhead :  38 [ns]
[GridSize =   131072, BlockSize = 256] elapsed time A :    88857 [ns], elapsed time B :  2930381 [ns], time/op : 2.709888e+00 [ns], launch overhead :  60 [ns]
[GridSize =   262144, BlockSize = 256] elapsed time A :   177676 [ns], elapsed time B :  5859977 [ns], time/op : 5.419065e+00 [ns], launch overhead : 105 [ns]
[GridSize =   524288, BlockSize = 256] elapsed time A :   355263 [ns], elapsed time B : 11717645 [ns], time/op : 1.083601e+01 [ns], launch overhead : 189 [ns]
```

- Intel Xeon E-2136
- NVIDIA GeForce RTX 3080

## License
MIT
