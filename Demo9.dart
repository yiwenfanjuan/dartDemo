import 'dart:math';

main(List<String> args) {
  print("类的使用");
  
  //通过普通方式的构造函数创建对象
  var point = Point(100,100);
  point._y = 200;
  point.printLocation();

  //通过使用构造函数别名来创建一个对象
  var point2 = Point.fromJson({"pointX": 300,"pointY": 600});
  point2?.printLocation();

  point?._y = 300;//当point不为空的时候修改其中的_y的值
  point?.printLocation();

  var point1;
  point1?._y = 200;
  print("point1为空：${point1?._y}");

  //使用new关键字来创建对象
  var point3 = new Point(200, 200);
  var point4 = new Point.fromJson({"pointX":500,"pointY":600});

  //使用常量构造函数
  var point5 = const ImmutablePoint(100, 100);
  var point6 = ImmutablePoint(100,100);
  var point7 = const ImmutablePoint(100, 100);
  var point8 = const ImmutablePoint(200, 200);
  var point9 = ImmutablePoint(100, 100);
  print(point5 == point6);//true
  print(point5 == point7);//true
  print(point5 == point8);//false
  print(point6 == point9);//true
  //通过上面的比较可以看出，当创建了两个编译时常量的对象时，如果对象中的实例变量的值一样，那么这两个对象就是相等的
  //如果创建的不是便是常量的对象，那么即便实例变量中的值时一样的，那么这两个对象也不相等
  //使用const修饰的构造函数，在创建的对象可以创建出不是const类型的对象
  //可以通过重写hashCode的getter和==来实现自定义对象的判断
  //使用identical来判断两个对象是否是同一个实例
  print("identical point5 and point6: ${identical(point5, point6)}");//false
  print("identical point5 and point7: ${identical(point5, point7)}");//true
  print("identical point5 and point8: ${identical(point5, point8)}");//false
  print("identical point6 and point9: ${identical(point6, point9)}");//false

  Map map1 = Map();
  //创建一个常量map
  const Map pointAndLine = const {"point": const [const ImmutablePoint(100, 100)],
                                  "line": const [const ImmutablePoint(200,200),const ImmutablePoint(300,300)]};
  //上面的定义可以简写成下面的形式：
  const pointAndLine1 = {"point": [ImmutablePoint(100,100)],
                          "line": [ImmutablePoint(200,200),ImmutablePoint(200,200)]};

  Rectangle rectangle = Rectangle(10, 20, 30, 40);
  print(rectangle.width);

  //父类引用指向子类对象
  TestConstract constract1 = TestConstractInherited.fromMap({"name": "哈哈哈","parent": "嘿嘿嘿"});
  constract1.printInfo();

  TestConstract constract2 = TestConstractInherited2.fromMap({"name": "哼哼哼","parent": "呀呀呀"});
  constract2.printInfo();

  TestRect testRect = TestRect(100, 100);
  testRect.printInfo();

  TestRect testRect1 = TestRect.finalHeight(20);
  testRect1.printInfo();

  var logger = Logger("UI");
  logger.log("Button Click");

  //实例方法演示
  TestInstanceMethod testMethod = TestInstanceMethod(10,10);
  TestInstanceMethod testMethod1 = TestInstanceMethod(100, 100);
  print("$testMethod 到 $testMethod1 的直线距离为${testMethod.distanceTo(testMethod1)}");
}

class Point{
  int _x;
  int _y;
  //定义一个构造函数
  Point(this._x,this._y);
  //通过指定别名来定义一个构造函数
  Point.fromJson(Map map){
    _x = map["pointX"];
    _y = map["pointY"];
  }

  //输出这个点所在的坐标位置
  void printLocation(){
    print("当前点所在的位置为($_x,$_y)");
  }

  

}

class ImmutablePoint{
    final int  _immutableX;
    final int _immutableY;

    const ImmutablePoint(this._immutableX,this._immutableY);
    


    @override
      // TODO: implement hashCode
      int get hashCode{
        return _immutableX * _immutableY;
      }

    @override
    bool operator ==(dynamic point){
      if(_immutableX == point._immutableX && _immutableY == point._immutableY){
        return true;
      }
      return false;
    }
   

}

class Rectangle{
  //定义四个变量
  num left;
  num right;
  num top;
  num bottom;

  Rectangle(num _left,num _right,num _top,num _bottom){
    this.left = _left;
    this.right = _right;
    this.top = _top;
    this.bottom = _bottom;
  }

  //如果想要重写一个属性getter或者setter，那么不需要定义这个变量，直接重写这两个方法即可
  num get width {
    return right - left;
  }
  
  num get height{
    return bottom - top;
  }
  set height(num value){
    print("top is $top,bottom is$bottom,宽高是否合法:${value > (bottom - top)}");
  }

  set duijiao(num value){
    this.duijiao = value;
  }

  //无法重写已经定义的变量的getter和setter,不知道是不是我没找到

}

class TestConstract{
  String _name;
  String _parent;

  //声明一个默认的无参的构造函数
  TestConstract(){

  }
 
  //命名构造函数
  TestConstract.fromMap(Map map): _name = map["name"],_parent = map["parent"]{
    print("run width TestConstract fromMap");
    this._name = map["name"];
    this._parent = map["parent"];
    print("run width TestConstract fromMap end,and name is $_name,parent is$_parent");
  }

  //赋值时直接使用
  //注意：如果已经显式声明了构造函数（这里不包括命名构造函数），则下面这种方式不能使用
  //TestConstract(this._name,this._parent);

   String printInfo(){
    print("this is ${this.toString()},and name is $_name, parent is $_parent");
  }

}

class TestConstractInherited extends TestConstract{

  //实现父类的命名构造函数
  TestConstractInherited.fromMap(Map map): super.fromMap(map){
    print("run with TestConstractInherited fromMap");
    _name = "child" + map["name"];
    _parent = "child" + map["parent"];
  }

}

class TestConstractInherited2 extends TestConstract{

    TestConstractInherited2.fromMap(Map map): super.fromMap(map) {
    
    }

}

class TestRect {
  
  final num _width;
  final num _height;
  final num _area;

  TestRect(num width, num height): _width = width,
                                  _height = height,
                                  _area = width * height;

  //重定向构造函数
  TestRect.finalHeight(num width): this(width,100);

  String printInfo(){
    print("this rect width is $_width, height is $_height,area is $_area");
  }
  
}

class Logger{
  final String name;
  bool mute = false;
  static Map<String,Logger> _cache = <String,Logger>{};

  
  Logger.internal(this.name);
 
  //创建一个工厂构造函数，用于返回指定name的实例
  factory Logger(String name){
    if(_cache.containsKey(name)){
      return _cache[name];
    }else{
       final logger = Logger.internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  void log(String msg){
    if(!mute) print(msg);
  }

}

class TestInstanceMethod{
  num pointX;
  num pointY;

  TestInstanceMethod(this.pointX,this.pointY);

  //实例方法
  num distanceTo(TestInstanceMethod other){
    //输出两个点之间的距离
    var dx = other.pointX - pointX;
    var dy = other.pointY - pointY;
    return sqrt(dx * dx + dy * dy);
  }
}
 