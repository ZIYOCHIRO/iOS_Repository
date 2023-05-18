OC对象的分类

Objective-C中的对象，简称OC对象，主要可以分为3种：
- instance对象（实例对象）
	- instance对象就是通过类alloc出来的对象，每次调用alloc都会产生新的instance对象，每个instance对象是不同的，占据不同的内存
	- instance对象在内存中存储的信息包括
		- isa指针
		- 其他成员变量 （person->_age, person->_height）
	- NSObject *object1 = [[NSObject alloc] init];
- class对象（类对象）
	- 每个类在内存中有且只有一个Class对象
	- class对象在内存中存储的信息包括：
		- isa指针
		- superclass指针
		- 类的属性信息（@property）、类的对象方法信息（instance method）
		- 类的协议信息（protocol）、类的成员变量信息（ivar）
	- 获取类对象的三种方法：
		- NSObject *object1 = [[NSObject alloc] init];
		- Class objectClass2 = [object1 class]; //调用 class方法
		- Class objectClass3 = [NSObject class]; //调用 class方法
		- Class objectClass4 = object_getClass(object1); // 将实例对象当参数传入，获得类对象

- meta-class对象（元类对象）
	- 每个类在内存中有且只有一个meta-class对象
	- meta-class对象和class对象的内存结构是一样的，但是用途不一样，在内存中存储的信息主要包括：
		- isa指针
		- superclass指针
		- 类的类方法信息（class method）
	- 获取元类对象的方法：
		- Class objectMetaClass = object_getClass([NSObject class]);//将类对象当作参数传入，获得元类对象

NOTE：class方法返回的一直是class对象，类对象
- Class objectNOTMetaClass = [[[NSObject class] class] class]; 返回的是class对象，而不是meta-class对象



三个容易混淆的函数

object_getClass 和objc_getClass  [NSObject class]的区别：
- object_getClass(id obj)
	- 传入instance对象，返回class对象
	- 传入class对象，返回meta-class对象
	- 传入meta-class对象，返回NSObject（基类）的meta-class对象
- objc_getClass(const char *name)
	- 传入类名，返回class对象
-  [NSObject class]：
	- 返回class对象
