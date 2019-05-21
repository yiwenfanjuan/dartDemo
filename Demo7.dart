
var level1 = "level1";
main(List<String> args) {
  
  print("main===> $args");

  travel();
  travel(from: "Japan");
  travel(to: "china");
  travel(from: "USB",to: "Screen");

  animals();

  //匿名函数
  //匿名函数的定义
  //（[Type] param1 [......]）{
  //   codeBlock();;
  //}
  var testList = ["cat","dog"];
  testList.forEach((item) => print("anima : $item"));
  var level2 = "level2";
  //内部函数
  void testScope(){
    var level3 = "level3";
    print(level1);
    print(level2);
    print(level3);
  }
  testScope();

  //闭包，闭包是一个函数对象，可以读取其它作用域内的变量使用，使用匿名函数可以轻松实现一个闭包
  //下面的实例来源于官网
  var testAdd5 = makeAddr(10);
  var testAdd10 = makeAddr(11);
  //可以先看一下这两个变量运行时的类型
  print("testAdd5 type is ${testAdd5.runtimeType}");//testAdd5 type is (dynamic) => dynamic
  print("testAdd10 type is ${testAdd10.runtimeType}");//testAdd10 type is (dynamic) => dynamic

  print(testAdd5(20));//30
  print(testAdd10(11));//22

  var testFunctionVar1 = testFunction("哈哈哈");
  print("testFunction type is ${testFunctionVar1.runtimeType}");
  print(testFunctionVar1("哈哈哈","嘻嘻嘻"));
}

//函数参数默认值
//参数的默认值必须是编译时常量,这里说的是默认值的值必须是明确的一个数据，并不是说参数要用const修饰
void travel({String from = "china",String to = "usa"}){
  print("From $from and to $to");
}

//List和Map的默认值需要用const修饰
void animals({List<String> names =const ["cat","dog"],Map nameMap = const {
  "c": "cat",
  "d": "dog"
}}){
  print("animals $names");
  print("animalMap: $nameMap");
}

//返回一个函数对象
Function makeAddr(num){
  //返回一个匿名函数
  return (var addNum){
    return num + addNum;
  };
}

//定义一个函数
String testFunction1(String str1,String str2){
  return str1 + str2;
}

Function testFunction(String str){
  return testFunction1;
}