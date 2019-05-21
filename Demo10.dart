
enum Color{red,green,blue}

main(List<String> args) {
  print(printInfo(Person("Candy")));
  print(printInfo(Impostor()));

  Vector v1 = Vector(100, 100);
  Vector v2 = Vector(200, 200);
  print("${v1 + v2}");
  print("${v1 - v2}");

  print(Color.red.index);
  print(Color.green.index);
  print(Color.blue.index);

  List<Color> colorList = Color.values;
  print(colorList);
  print(colorList[2]);

  Color currentColor = Color.red;
  switch(currentColor){
    case Color.blue:

      break;
    case Color.green:

      break;
    case Color.red:

      break;
  }

  if(100 > TestStaticClass.FIRST_PARAM){
    print("哈哈哈");
  }else{
    print("哼哼哼");
  }
  print(TestStaticClass.isRight(200));
}

//输出用户信息
String printInfo(Person person) => person.greet("Bob"); 

abstract class Classes{
  String name;
  //定义一个需要子类去实现的方法
  String teacher();
  
}

class MathClass extends Classes{
  //实现父类中定义的方法
  @override
    String teacher() {
      // TODO: implement teacher
      return null;
    }

}

class Person{

  final String name;

  Person(this.name);

  String greet(String who) => "Hello $who, i am $name";
}

class Impostor implements Person{

  //重写name的get方法
  String get name => "";

  @override
    String greet(String who) {
      // TODO: implement greet
      return "Hi $who,do you know who am I?";
    }
}

//运算符覆盖演示
class Vector{
  num x;
  num y;

  Vector(this.x,this.y);

  //覆盖+运算符，返回对象
  Vector operator +(Vector v) => Vector(x + v.x,y + v.y);
  //覆盖-运算符
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  @override
    String toString() {
      // TODO: implement toString
      return "x is $x, y is $y";
    }
}

class TestStaticClass{
  //定义一个静态变量
  static const FIRST_PARAM = 60;

  //定义一个静态方法
  static bool isRight(num grade){
    if(grade > FIRST_PARAM){
      return true;
    }
    return false;
  }
}