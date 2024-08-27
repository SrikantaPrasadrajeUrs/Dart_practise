void main(List<String> args) {
  List<int> vals = [0,2,3,4,5,6,7,8,99];
  print(binarySearch(vals, 99, 0, vals.length-1));
}

int binarySearch<T extends num>(List<T> arr,T value,int start,int end){

if(start>end){
  return -1;
}
int mid =start+((end-start)~/2);
if(arr[mid] == value){
  return mid;
}

if(arr[mid]>value){
  return binarySearch(arr, value, start, mid-1);
}

if(arr[mid]<value){
  return binarySearch(arr, value, mid+1, end);
}
return -1;
}