- 调用的类方法，为什么实例方法也可以？不会报错
	- 因为OC的本质是发消息，只管方法名，不管前面的加减号
	- objc_msgSend(receiver, @selector(message))
SRPerson在调用- (void)otherTest的时候，流程如下，由于NSObject(meta-class)的superclass指针指向NSObject (class)，最终会找到实例方法- (void)otherTest 