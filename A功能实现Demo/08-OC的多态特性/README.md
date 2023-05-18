## 多态
多态就是用父类类型的指针创建子类的对象，比如Child类继承了Parent类
代码的体现：Parent类型的指针指向Child
```
SRParent *parent = [[SRChild alloc] init];
```

### Example
> SRDog, SRRabit, SRHamster 这些动物都继承 SRAnimal。
> SRZooManager作为管理层为每一种动物喂食，只需要与SRAnimal交互即可，而不需要与具体的每种动物交互。

```
 // 给每一个动物喂食
for (NSString *animalId in RegisterAnimalBook.allKeys) {
    // animalClass 是SRDog/SRRabit/SRHamster其中的一个
    Class animalClass = RegisterAnimalBook[animalId];
    // SRAnimal类型的指针指向子类
    SRAnimal *currentAnimal = [[animalClass alloc] init]; 
    [currentAnimal eatFood];
}
```
