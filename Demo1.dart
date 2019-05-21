void main(){
  //输出100到999的水仙花数
  var startNum = 100;
  while(startNum < 1000){
    //获取百位上的数
    int firstNum = startNum ~/ 100;
    //获取十位上的数
    int secondNum = (startNum % 100) ~/ 10;
    //获取个位上的数
    int thirdNum = ((startNum % 100) % 10).toInt();
    //print("百位${firstNum} 十位${secondNum} 个位${thirdNum}");
    //判断是否是水仙花数
    if(firstNum * firstNum * firstNum
        + secondNum * secondNum * secondNum
        + thirdNum * thirdNum * thirdNum == startNum){
      print("水仙花数：${startNum}");
    }
    startNum++;
  }
}
