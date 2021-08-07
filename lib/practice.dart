void main(){
  List<int>one = [1,2,4];
  for(int i = 0; i<one.length; i++){
    print(one[i]);
  }
  one.add(5);
  one.add(6);
  one.add(10);
  print(one.length);
  for(int i = 0; i<one.length; i++){
    print(one[i]);
  }
  print(one[0]);
}