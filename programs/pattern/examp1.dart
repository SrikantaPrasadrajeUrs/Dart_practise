import "dart:io";

void main(List<String> args) {
  patter1(6);
}

void patter1(int n){
  for(int i=0;i<n;i++){
    int temp=n;
    int val=i+1;
    for(int j=n-1-i;j>=0;j--){
      stdout.write("$val ");
      val+=temp--;
    }
    print("");
  }
}