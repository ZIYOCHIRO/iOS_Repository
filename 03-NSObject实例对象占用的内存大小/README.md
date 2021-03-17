
- 我们平时编写的OC代码，底层实现其实都是C/C++代码
	- OC → C/C++ → 汇编语言 →机器语言
	- 所以OC的面向对象都是基于C/C++的数据结构实现的
		- OC的对象、类主要是基于C/C++的结构体实现的
	- 将OC代码转换成C/C++代码
		- clang -rewrite-objc main.m -o main.cpp 
		- 指定arm64架构  xcrun -sdk iphoneos clang -arm64 -rewrite-objc main.m -o main-arm64.cpp  
			- 不同的平台支持的代码不一样，模拟器（i386），32bit（armv7），64bit（arm64）
- 一个NSObject对象占用多少内存？
	- (前提)isa指针在32位占8个字节，在64位占16个字节
	- 系统分配了16个字节给NSObject对象（通过malloc_size）
	- 但NSObject对象内部只使用了8个字节的空间(64bit环境下)（通过class_getInstanceSize）

- 内存对齐：结构体的大小必须是最大成员大小的倍数
```
struct Student_IMPL {
    Class isa; // 8
    int _age; // 4
    int _height; // 4
    int _no; //4
}; //20

结构体的大小必须是最大成员大小的倍数，所以是8的倍数也就是24，而不是20
```

- 两个容易混淆的函数
	- 创建一个实例对象，至少需要多少内存？
		- #import <objc/runtime.h>
		- class_getInstanceSize([NSObject class])
	- 创建一个实例对象，实际上分配了多少内存？
		- #import <malloc/malloc.h>
		- malloc_size((__bridge const void *)object)
