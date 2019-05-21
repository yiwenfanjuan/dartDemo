void main(List<String> args) {
  print("这个demo用来演示Map中常用的属性和方法");
  //初始化Map
  //普通方式,不指定任何类型，这时testMap中K-V的类型均是dynamic
  Map testMap = Map();
  print("testMap: $testMap");
  testMap[1] = "哈哈哈";

  //强制使用指定类型初始化map
  Map testMap1 = Map<int,String>();

  //不使用类型操作符,从另一个map中初始化新的map，此时新的map中含有另一个map中的资源
  Map testMap2 = Map.castFrom(testMap);

  //强制使用指定类型初始化map
  //下面的例子表示testMap1的类型为<num,String>,初始化Map时castFrom中map的类型为<int,String>
  //如果类型不匹配或者不兼容就会导致程序crashh
  //Map testMap3 = Map.castFrom<num,String,int,String>(testMap);//这行代码会出错，主要原因是testMap是<dynamic,dynamic>类型的，但是这里需要的是<int,String>类型的map
  //Map testMap4 = Map.castFrom<int,String,String,String>(testMap);//这行代码也会出错，因为无法将<String,String>类型的map转换为<int,String>类型的map
  Map testMap3 = Map.castFrom<int,String,int,String>(testMap1);
  print("testMap3:$testMap3 and type is ${testMap3.runtimeType}");

  //无法使用指定参数类型，只能从另一个map中初始化一个新的map
  Map testMap4 = Map.from(testMap);
  print("testMap4:$testMap4 and type is ${testMap4.runtimeType}");

  //无法使用指定类型参数，从一个实现了Iterable接口的集合中初始化map
  var testList = List<MapEntry<int,String>>();
  testList.add(MapEntry(1,"哈哈哈"));
  testList.add(MapEntry(2,"嘻嘻嘻"));
  Iterable testIterable = testList.take(testList.length);
  Map testMap5 = Map.fromEntries(testIterable);
  print("testMap5:$testMap5,and type is ${testMap5.runtimeType}");


  //不支持指定类型，创建一个默认的map
  Map testMap6 = Map.identity();
  print("\ntestMap6:$testMap6,and type is ${testMap6.runtimeType}\n");

  Map testMap7 = Map.fromIterable(testIterable,key: (item) => item.toString()+"哈哈哈",value: (item) => item.toString()+"嘻嘻嘻");
  print("\ntestMap7:$testMap7,and type is ${testMap7.runtimeType}\n");

  //从一个可迭代的对象中获取key,从另一个可迭代的对象中获取value,然后使用两个Iterable创建出map
  var testList1 = List();
  var testList2 = List();
  testList1.add("one");
  testList1.add("two");
  testList1.add("three");
  testList1.add("one");
  testList2.add(1);
  testList2.add(2);
  testList2.add(3);
  testList2.add(4);
  Iterable testIterable1 = testList1.take(testList1.length);
  Iterable testIterable2 = testList2.take(testList2.length);
  Map testMap8 = Map.fromIterables(testIterable1, testIterable2);
  print("\ntestMap8:$testMap8, and type is ${testMap8.runtimeType}\n");

  //从另一个Map中创建一个新的Map对象
  Map testMap9 = Map.of(testMap1);
  print("\n通过Map.of创建Map对象：$testMap9,and type is ${testMap9.runtimeType}\n");

  //创建一个不可修改的基于散列的map
  Map testMap10 = Map.unmodifiable(testMap5);
  print("\n通过Map.unmodifiable创建Map对象：$testMap10,and type is ${testMap10.runtimeType}\n");


  //常用字段
  //需要注意的是：在调用这些字段的时候需要判断map是否为空，如果map为空则会抛出error，如：NoSuchMethodError: The getter 'length' was called on null.
  testMap8["哈哈哈"] = "呸呸呸";

  //获取map的长度:length字段
  print("\ntestMap8的长度：${testMap8.length}\n");

  //获取所有的key，返回一个Iterable
  print("\ntestMap8的key值${testMap8.keys}\n");

  //获取所有的value,返回一个Iterable
  print("\ntestMap8的value值：${testMap8.values}\n");

  //isEmpty:查看是否为空,map中没有元素的时候返回true，注意不是map == null
  print("\ntestMap8是否为空：${testMap8.isEmpty}\n");

  //isNotEmpty是否为非空,当map中至少有一个值的时候返回true，注意不是map == null，map != null 但是map中没有元素仍然返回false
  print("\ntestMap8是否为非空：${testMap8.isNotEmpty}\n");

  //将map输出为Iterable
  print("\ntestMap8的entries:${testMap8.entries}\n");

  //常用方法
  testMap8[1.235] = "1.2222";
  testMap8[4] = "4";
  //当map中包含指定的key时返回true
  //比较的时候需要注意数据类型
  print("\n$testMap8");
  bool containsKey1 = testMap8.containsKey("4");
  bool containsKey2 = testMap8.containsKey("one");
  bool containsKey3 = testMap8.containsKey(4);
  print("\ntestMap8的key中是否包含字符串4:$containsKey1");
  print("\ntestMap8的key中是否包含one:$containsKey2");
  print("\ntestMap8的key中是否包含数字4:$containsKey3");

  //当map中包含指定的value时返回true
  //比较的时候需要注意数据类型
  bool containsValue1 = testMap8.containsValue("4");
  bool containsValue2 = testMap8.containsValue(4);
  bool containsValue3 = testMap8.containsValue("哈哈");
  print("\ntestMap8的value中是否包含字符串4：$containsValue1");
  print("\ntestMap8的value中是否包含数字4:$containsValue2");
  print("\ntestMap8中是否包含字符串哈哈:$containsValue3");

  //通过Iterable<Map<K,V>>来添加数据
  List testList3 = List<MapEntry<String,int>>();
  testList3.add(MapEntry("咚咚咚", 22));
  testList3.add(MapEntry("哼哼哼", 100));
  Iterable testIterable3 = testList3.reversed;
  testMap8.addEntries(testIterable3);
  print("\n使用addEntries添加数据之后的map:$testMap8");

  //通过addAll(Map<K,V>)来添加数据
  print("$testMap2");
  testMap8.addAll(testMap2);
  print("通过addAll添加数据之后的map:$testMap8");

  //这个方法可以看作强制判断Map中的数据是否符合<RK,RV>中指定的数据类型，如果存在不符合<RK,RV>指定的数据类型，就会出现error
  Map<dynamic,dynamic> testCast = testMap8.cast();
  print("\ntestCast:$testCast");

  //取出当前map中的key和value在传入map中的函数中进行操作
  var testMapF = testMap8.map((key,value) => checkMap1(key, value));
  print("\n使用map对之前的Map进行操作，并返回一个新的Map:$testMapF，and testMapF is ${testMapF.runtimeType}");


  print("\n$testMap8");
  //删除符合条件的map中的元素
  testMap8.removeWhere((key,value) => key is int);//[4:4]这个元素被删除了
  print("删除testMap8中key是int类型的元素:$testMap8");

  //更新key中的信息，如果key不存在，会调用第三个参数中指定的函数，第三个参数为可选参数
  testMap8.update("one", (value) => "new"+ value.toString());
  print("\n更新一个map中存在的key的元素:$testMap8");
  //从源码中可以看出：如果在map中找到了指定的key，就会根据第二个参数指定的规则去修改key对应的value的数据
  //如果没有找到指定的key，就会去查看第三个参数是否设置
  //如果第三个参数没有设置，直接抛出error
  //如果设置了第三个参数，就会指定第三个参数，执行完之后会在当前map中添加元素：未找到的key:第三个参数返回的数据
  //如果第三个参部的函数没有返回值（void），那么依然会添加元素：未找到的key:null
  testMap8.update(4, (value) => "new" + value.toString(),ifAbsent: checkMap2);
  print("更新一个map中不存在的元素并且指定ifAbsent参数：$testMap8");

  //自定义更新操作
  testMap8.updateAll((key,value) => checkMap3(key, value));
  print("自定义更新操作之后testMap8中的值:$testMap8");

  //循环输出Map中的值
  print("\ntestMap8中的值:");
  testMap8.forEach((key,value) => print("$key : $value"));

  //添加数据
  print("\n添加数据之前：$testMap8");
  //添加一个已经存在的数据
  testMap8.putIfAbsent("three", () =>checkMap2());
  //添加一个不存在的数据
  testMap8.putIfAbsent("哒哒哒", () => checkMap2());
  print("添加数据之后$testMap8");//可以发现之前已经存在的key的数据并没有被改掉，之前没有的key会被添加进去并将第二个参数的函数的返回值作为value


  //清空map中的数据
  testMap8.clear();
  print("\ntestMap8中的数据被清空之后： $testMap8");

}

//定义一个函数
MapEntry checkMap1(dynamic key,dynamic value){
  print("传入的key:$key,传入的value$value");
  MapEntry entry;
  entry = MapEntry("new" + key.toString(), "new" + value.toString());
  return entry;
}

String checkMap2(){
  print("not found key");
  return "not found key";
}

dynamic checkMap3(dynamic key,dynamic value){
  if(key is num){
    //如果当前数据类型是num value就设置为key + 1
    return key + 1;
  }
  //如果数据类型不是num，直接将原来的value返回，这里一定要return，如果没有return，会默认return null
  return value;
}




