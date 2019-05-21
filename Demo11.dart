void main(List<String> args) {
  _method1();
}

//异步程序method1
void _method1(){
  List<String> strArray = <String>['a','b','c'];
  print("method1 before loop");
  strArray.forEach(_readArray);
  print("method1 end of loop");
}

//读取数组中的数据
void _readArray<T>(T t) async{
  await delayedPrint(t.toString());
}

Future<void> delayedPrint(String value) async{
  await Future.delayed(Duration(seconds:1));
  print("delayedPrint: $value");
} 