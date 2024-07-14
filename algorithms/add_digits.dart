class Solution {
  int addDigits(int num) {
    int len ='$num'.length;
    int sum=0;
    while(len>0){
        len--;
        // print(n);
        sum+=num%10;
        num=(num~/10);
    
    }
    return '$sum'.length>1?addDigits(sum):sum;
  }
}
