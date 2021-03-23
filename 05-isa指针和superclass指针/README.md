isa指针和superclass指针

- isa指针
	- instance的isa指向class
		- 当调用对象方法时， 通过instance的isa找到class，最后找到对象方法的实现，进行调用
	- class的isa指向meta-class
		- 当调用类方法时，通过class的isa找到meta-class，最后找到类方法的实现，进行调用
```
SRStudent *student = [[SRStudent alloc] init];
Class studentClass = [student class];
Class studentMetaClass = object_getClass([NSObject class]);
        
//由于 studentInstanceMethod 存储在 studentClass中，student会通过isa找到studentClass，再调用对象方法
[student studentInstanceMethod];
//由于 studentClassMethod 存储在 studentMetaClass 中，SRStudent会通过isa找到 studentMetaClass，再调用类方法
[SRStudent studentClassMethod];
```


- class对象的superclass指针
	- 当 SRStudent 的instance对象student要调用Person的对象方法时， 会先通过isa找到studentClass，再通过studentClass的superclass找到Person的class，最后找到对象方法的实现进行调用
	- [student personInstanceMethod];
- meta-class的superclass指针
	- 当SRStudent要调用Person的类方法，会通过isa找到SRStudent的meta-class，SRStudent的meta-class再通过superclass找到Person的meta-class，最后找到类方法的实现进行调用
	-  [SRStudent personClassMethod];

NOTE: 如果方法都没找到就会出现这个错误 error: unrecognized selector sent to instance