void main(List<String> args) {
  List<int> arr = [99,2,3,1,4,5,3,22,1,34,2];
  print(quickSort(arr));
}

List<int> quickSort(List<int> arr){
  if(arr.length<2){
    return arr;
  }
  int start = arr[0];
  List<int> lesser = [];
  List<int> greater = [];
  arr.removeAt(0);
  for(int i=0;i<arr.length;i++){
    if(arr[i]<start){
      lesser.add(arr[i]);
    }else{
      greater.add(arr[i]);
    }
  }
  return quickSort(lesser)+[start]+quickSort(greater);
}