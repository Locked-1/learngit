本例用于测试QNX上内存申请、使用及释放的耗时，用于对比Linux相同操作的差距

编译运行方式：
1. Linux-TDA4上
    # 编译
    source ${your_aarch86_toolchain_dir}/xxx.sh # 首先设置aarch64编译器
    mkdir -p build_linux; cd build_linux
    cmake -DCMAKE_CXX_COMPILER=aarch64-linux-gnu-g++ ..
    make
    # 运行
    ../run.sh

2. QNX-TDA4上
    # 编译
    source ${your_qnx_toolchain_dir}/qnx700/qnxsdp-env.sh # 首先设置qnx编译器
    mkdir -p build_qnx; cd build_qnx
    cmake -DCMAKE_CXX_COMPILER=ntoaarch64-g++ ..
    make
    # 运行
    ../run.sh

结论:
QNX系统上新申请内存、首次使用及释放均非常耗时

log信息说明:
1. malloc, memset和free，QNX上比Linux上更加耗时，大概多出2-22倍时间
2. 首次进行内存访问，耗时比以后访问同一块内存的时间要大，QNX比Linux上更加明显，慢很多
3. 详见代码sample.cpp

                        QNX-TDA4                                                                        Linux-TDA4 

[test_malloc_set_and_free]:                                              |      [test_malloc_set_and_free]: 
        malloc use 32.000 ms,                                    [notice]|              malloc use 10.965 ms, 
        memset to 0 use: 1041.000 ms,                            [notice]|              memset to 0 use: 195.313 ms, 
        free use: 191.000 ms                                     [notice]|              free use: 8.656 ms
                                                                         |      
[test_memset]: before 1st time memset_get_divsum                         |      [test_memset]: before 1st time memset_get_divsum
[memset_get_divsum]: memset use 10.000 ms                        [notice]|      [memset_get_divsum]: memset use 2.237 ms
[memset_get_divsum]: get sum use 15.000 ms                               |      [memset_get_divsum]: get sum use 14.836 ms
[test_memset]: 1st time, sum: [8], memset_get_divsum use 25.000 ms       |      [test_memset]: 1st time, sum: [8], memset_get_divsum use 17.093 ms
[memset_get_divsum]: memset use 2.000 ms                         [notice]|      [memset_get_divsum]: memset use 0.674 ms
[memset_get_divsum]: get sum use 15.000 ms                               |      [memset_get_divsum]: get sum use 14.867 ms
[test_memset]: 2nd time, sum: [8], memset_get_divsum use 17.000 ms       |      [test_memset]: 2nd time, sum: [8], memset_get_divsum use 15.555 ms
[memset_get_divsum]: memset use 2.000 ms                         [notice]|      [memset_get_divsum]: memset use 0.654 ms
[memset_get_divsum]: get sum use 15.000 ms                               |      [memset_get_divsum]: get sum use 14.861 ms
[test_memset]: 3th time, sum: [8], memset_get_divsum use 17.000 ms       |      [test_memset]: 3th time, sum: [8], memset_get_divsum use 15.525 ms
[memset_get_divsum]: memset use 1.000 ms                         [notice]|      [memset_get_divsum]: memset use 0.664 ms
[memset_get_divsum]: get sum use 16.000 ms                               |      [memset_get_divsum]: get sum use 14.869 ms
[test_memset]: 4th time, sum: [8], memset_get_divsum use 17.000 ms       |      [test_memset]: 4th time, sum: [8], memset_get_divsum use 15.542 ms
[memset_get_divsum]: memset use 2.000 ms                         [notice]|      [memset_get_divsum]: memset use 0.646 ms
[memset_get_divsum]: get sum use 15.000 ms                               |      [memset_get_divsum]: get sum use 14.839 ms
[test_memset]: 5th time, sum: [8], memset_get_divsum use 17.000 ms       |      [test_memset]: 5th time, sum: [8], memset_get_divsum use 15.494 ms
[test_memset]: 4th to 10th time, avg memset_get_divsum use 16.800 ms     |      [test_memset]: 4th to 10th time, avg memset_get_divsum use 15.486 ms
                                                                         |      
[test_valueset]: before 1st time valueset_get_divsum                     |      [test_valueset]: before 1st time valueset_get_divsum
[valueset_get_divsum]: valueset use 26.000 ms                    [notice]|      [valueset_get_divsum]: valueset use 19.783 ms
[valueset_get_divsum]: get sum use 15.000 ms                             |      [valueset_get_divsum]: get sum use 14.832 ms
[test_valueset]: 1st time, sum: [8], valueset_get_divsum use 41.000 ms   |      [test_valueset]: 1st time, sum: [8], valueset_get_divsum use 34.632 ms
[valueset_get_divsum]: valueset use 18.000 ms                            |      [valueset_get_divsum]: valueset use 18.467 ms
[valueset_get_divsum]: get sum use 15.000 ms                             |      [valueset_get_divsum]: get sum use 14.852 ms
[test_valueset]: 2nd time, sum: [8], valueset_get_divsum use 34.000 ms   |      [test_valueset]: 2nd time, sum: [8], valueset_get_divsum use 33.332 ms
[valueset_get_divsum]: valueset use 18.000 ms                            |      [valueset_get_divsum]: valueset use 18.491 ms
[valueset_get_divsum]: get sum use 14.000 ms                             |      [valueset_get_divsum]: get sum use 14.828 ms
[test_valueset]: 3th time, sum: [8], valueset_get_divsum use 33.000 ms   |      [test_valueset]: 3th time, sum: [8], valueset_get_divsum use 33.331 ms
[valueset_get_divsum]: valueset use 18.000 ms                            |      [valueset_get_divsum]: valueset use 18.461 ms
[valueset_get_divsum]: get sum use 15.000 ms                             |      [valueset_get_divsum]: get sum use 14.831 ms
[test_valueset]: 4th time, sum: [8], valueset_get_divsum use 33.000 ms   |      [test_valueset]: 4th time, sum: [8], valueset_get_divsum use 33.304 ms
[valueset_get_divsum]: valueset use 18.000 ms                            |      [valueset_get_divsum]: valueset use 18.473 ms
[valueset_get_divsum]: get sum use 15.000 ms                             |      [valueset_get_divsum]: get sum use 14.827 ms
[test_valueset]: 5th time, sum: [8], valueset_get_divsum use 33.000 ms   |      [test_valueset]: 5th time, sum: [8], valueset_get_divsum use 33.312 ms
[test_valueset]: 4th to 10th time, avg valueset_get_divsum use 33.400 ms |      [test_valueset]: 4th to 10th time, avg valueset_get_divsum use 33.355 ms
    1.84s real     0.74s user     0.83s system                           |      real    0m 0.71s, user    0m 0.57s, sys     0m 0.13s                    

