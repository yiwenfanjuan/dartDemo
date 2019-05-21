main(List<String> args) {
  print("异常处理");
  //testException1();
  //testException2();
  //testException3();

  //捕获异常
  //使用try...on捕获异常信息，由于testException1抛出的不是一个正常的异常对象，此时无法捕获到异常，程序会直接crash
  // try{
  //   testException1();
  // } on Exception{
  //   print("捕获到异常");
  // }

  //对于不是Exception类型的异常信息，使用try...catch仍然可以捕获到异常信息
  try{
    testException1();
  }catch(e){
    print(e);
  }

  try{
    testException1();
  }catch(e,r){
    print("$e,$r");
  }

  try{
    testException2();
  }on Exception{
    print("testException2 on");
  }


  try{
    testException2();
  } on FormatException catch(e) {
    print("catch format exception");
    print(e);
    rethrow;//重新抛出异常
  }on Exception{
    print("catch exception");
  }catch(e,r){
    //匹配所有类型的异常，e是异常对象，r是StackTrance对象，异常的堆栈信息
    print("$e,$r");
  }finally{
    print("哈哈哈，管你有没有异常，老子就是要执行");//在rethrow之前执行
  }

  try{
    testException3();
  }catch(e,r){
     print("$e,$r");
  }
}

//非Exception也可以抛出异常，但是不建议这么使用
void testException1(){
  throw "this is a exception1";
}
//抛出异常
void testException2(){
  throw Exception("this is a Exception2");
}
//方法的简写
void testException3() => throw Exception("this is a Exception3");