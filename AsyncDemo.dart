import 'dart:io';
import 'dart:async';

String data;
main(List<String> args) {
  //getData();
  //test();
  print("main #1 of 2");
  scheduleMicrotask(() => print("microtask #1 of 2"));

  new Future.delayed(Duration(milliseconds:100),() => print("future #1 (delayed)"));

  new Future(() => print("future #2 of 3"));

  new Future(() => print("future #3 of 3"));

  scheduleMicrotask(() => print("microtask #2 of 2"));

  print("main #2 of 2");

}

setData() async{
   data = await getData();
   print("文件内容：${data}");
}

//获取数据
getData() async{
  //获取一个文件的内容
  String filePath = "C:/dartStudy/DartDemo/asyncTestFile.txt";
  File file = File(filePath);
  data =  await file.readAsString();
  print("文件内容：${data}");
}

//模拟获取数据
void test() async{
  String content = await getDatas();//这里因为类型不匹配，ide就会报错
  print("新文件内容：$content");
}

//获取一个文件中的数据，并写入其它数据
Future<String> getDatas() async{
  String filePath = "C:/dartStudy/DartDemo/asyncTestFile.txt";
  File file = File(filePath);
  var fileContent = await file.readAsString();
  await file.openWrite(mode: FileMode.APPEND).write(fileContent);
  return await file.readAsString();
}