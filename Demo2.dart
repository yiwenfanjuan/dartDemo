
//枚举的定义
enum Color {Red,Black,Green}
enum Animal {Dog,Cat}

void main(){
  //定义变量
  int n = 4;
  //不指定变量类型，使用var来定义变量
  var s = "this is a String";
  //如果一个变量在定义之后没有被赋过值，那么它就是null，int也是如此
  int a;
  var str;
  print(a == null);//true
  print(str == null);//true

  //定义bool值
  bool b1 = false;
  bool b2 = true;
  //定义数
  int n1 = 100;
  double  d = 1.34;
  num n2 = 123;
  num n3 = 1.234;
  //定义字符串
  String s1 = "双引号引起来的字符串";
  String s2 = '单引号引起来的字符串';
  String s3 = "如果用双引号表示字符串，字符串中的单引号''可以不用转义字符";
  String s4 = "如果使用单引号表示字符串，字符串中的双引号""可以不用转义字符";
  //定义列表
  List<String> list = ["1","2""3"];
  print(list.length);//这里输入出的列表长度是2，这时因为Dart中字符串的拼接就是把两个字符串放在一起就可以了
  //定义map
  Map<int,String> map = {
    1:"哈哈哈",
    2:"呵呵呵"
  };

  //使用枚举
  Animal animal = Animal.Cat;
  if(animal == Animal.Dog){
    print("这是一条狗");
  }else {
    print("这不是一条狗");
  }

  Person person = new Person(10, "admin");
  person.introduction();
  checkNumber(0);
  checkBool(true);
//  checkBool(1);
//  checkBool(-1);
//  checkBool("哈哈哈");
  checkGrade(99);
//  checkGrade(30);
//  checkGrade(60);
//  checkGrade(0);

  printNum();

  printList();

  printMap();
}

//判断一个数的大小
void checkNumber(num number){
  if(number > 0){
    print("${number}是正数");
  }else{
    if(number == 0){
      print("${number}是0");
    }else{
      print("${number}是负数");
    }
  }
}


void checkBool(var param){
  if(param){
    print("${param} 为 true");
  }else{
    print("${param} 为false");
  }
}

//比较成绩
void checkGrade(num grade){
  switch(grade ~/ 10){
    case 9:
      print("优秀");
      continue label;
    case 8:
      print("优良");
      continue label;
    case 7:
      continue label;
      break;
    label : case 6:
      print("及格");
      break;
    case 5:
    case 4:
    case 3:
    case 2:
    case 1:
    case 0:
      print("不及格");
      break;
    default:
      print("成绩格式不正确");
      break;
  }
}

//输出10-20的数
void printNum(){
  for(int i = 10; i < 21; i++){
    print(i);
  }
}

//输出List中的值
void printList(){
  List<int> intList = new List();
  intList.add(1);
  intList.add(10);
  intList.add(100);
  intList.forEach((int i) => print(i));
}

//输出map中的值
void printMap(){
  Map<int,String> map = {
    1:"哈哈哈"
  };
  map.forEach((int key,String value) => print("${key}--->${value}"));
}

class Person{
  int _age;
  String _name;

  Person(int age,String name){
    _age = age;
    _name = name;
  }

  void introduction() => print("我叫${_name},今年${_age}岁");
}