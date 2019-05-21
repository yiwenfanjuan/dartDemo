main(List<String> args) {
  print("运算符应用演示");

  //基本的算术运算符
  print(1+1);//2
  print(1-1);//0
  print(1 * 10);//10
  print(14 / 5);//2.8
  print(14 ~/5);//2
  print(-(1+1));//-2
  print(14 % 5);//4

  var test = 2;
  print(test++);//test++表达式，先返回值，在进行+1运算
  print(++test);//++test表示大，先进行+1运算，再返回值
  print(test--);//test--表达式，先返回值，在进行-1运算
  print(--test);//--test运算，先进行-1运算，再返回值

  //关系运算符
  print(1 == 1);//true
  print(1 != 1);//false
  print(2 > 1);//true
  print(2 < 1);//false
  print(2 >= 1);//true
  print(2 <= 1);//false

  //==和 !=不仅可以做数值的比较，还可以做对象的比较
  //而且 == 和 != 都可以进行运算符重载，对对象的判断可以使用自定义的重载函数
  print(null == null);//true
  print(null != null);//false
  print("a" == 'a');//true
  

  //类型测试运算符 is(判断是否是某一类) is!(判断是否不是某一类) as(将对象作为某一类使用，只能用于子类和父类之间转换使用)
  var testInt = 123;
  print(testInt is String);//false
  print(testInt is dynamic);//true
  print(testInt is! String);//true
  print(testInt is num);//true
  print(testInt is double);//false
  //as只能用于父类和子类之间转换使用
  print((testInt as num) is num);//true，将testInt作为num使用
  print((testInt as num) is double);//false
  //print((testInt as double) is num);//出错,double不是int的子类型

  //位运算符 &（按位与） |(按位或) ^(按位异或) ~(按位取反) <<(按位左移) >>(按位右移)
  //下面是官网的例子
  final value = 0x22;
  final bitmask = 0x0f;

  print((value & bitmask) == 0x02);//true and
  print((value & ~bitmask) == 0x20);//true and not
  print((value | bitmask) == 0x2f);//true OR
  print((value ^ bitmask) == 0x2d);//true xor
  print((value << 4) == 0x220);// true shift left
  print((value >> 4) == 0x02);//true shift right

  //逻辑运算符 &&(与) ||(或) !(非)
  var a = 12;
  print(a > 10 && a < 11);//false
  print(a > 10 || a < 11);//true
  print(!(a > 10));//false

  //赋值运算符 =  同时也可以与其它运算符组成运算符比如 += 
  var b = 1;
  print(a+=1);//2
  print(a -= 1);//1

  //其它运算符 ??(是否为空) expr?val1:val2(三元运算符) ..(级联运算符) .(成员访问) ?.(有条件的成员访问) ()(函数调用)，[](列表索引的值)
  var nullVal;
  var notNullVal = "哈哈哈";
  var intVal = 12;
  
  //如果nullVal为空，则赋值
  nullVal ??= intVal;
  notNullVal ??= "去去去";

  print(nullVal);
  print(notNullVal);

  //三元运算符
  print(intVal > 10 ? "大于10" : "不大于10");

  //允许在同一个对象上进行连续操作
  var testList = ["哈哈","213",12321];
  var testSet = testList.toSet()//返回一个Set对象
    ..add(5)//继续在上一个Set对象中操作
    ..add(12321);//继续在上一个Set对象中操作
  
  print(testSet);

  //上面的操作相当于：
  var testSet1 = testList.toSet();
  testSet1.add(5);
  testSet1.add(12321);

  //?.允许左侧的对象为空
  Map testMap;
  print(testMap?.length);//null
  //print(testMap.length);//报错 testMap为空
  print(testList?.length);//3
  

}