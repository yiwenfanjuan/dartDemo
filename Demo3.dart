void main(){
  print(fun5(10));
  printComplex(10);
  printComplex(20,b: 50);

  printComplex2(10);
  printComplex2(10,b: 200);
  printComplex2(20,c: 300);
  printComplex2(10,b:10,c: 10);

  fun7(10, 20);
  fun7(10, 20,30);
  fun7(10, 20,30,40);
}

//接收两个int参数，返回int类型的函数
int Func1(int a, int b){
  return a+ b;
}

//接收一个String，没有返回值的函数
void Fun2(String a){
  print(a);
}

//没有参数，返回String类型的函数
String Fun3(){
  return "hello dart";
}

//使用简洁方式定义函数
int fun4() => 1;
int fun5(int x) => fun4() + x + 1;

//函数没有返回值，且函数体只有一条语句
void fun6() => print("dart 哈哈哈");

//可选参数实例
void printComplex(num a,{num b: 0}){
  print("${a + b}");
}

//可选参数实例
void printComplex2(num a,{num b: 0,num c: 100}){
  print("${a + b + c}");
}

//针对参数位置的可选参数
void fun7(int a,int b,[int c = 100,int d = 200]){
  print("a=${a},b=${b},c=${c},d=${d}");
}

