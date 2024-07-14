import "dart:collection";

class Solution {
  int calculate(String s) {
    int l = s.length;
    int sign = 1;
    int answer = 0;
    Queue<int> stack = Queue<int>();

    for(int i=0;i<l;i++){
        String currentChar = s[i];
      switch(currentChar){
        case "+":{
          sign=1;
          break;  
        }
        case "-":{
            sign =-1;
            break;
        }
        case "(":{
            stack.addFirst(answer);
            stack.addFirst(sign);
            answer = 0;
            sign =1;
            break;
        }
        case ")":{
            int pSign  = stack.removeFirst();
            int val = stack.removeFirst();
            answer=val+pSign*answer;
            break;
        }
        case " ":{
            break;
        }
        default:{
            int startIndex = i;
            while(i<l&&isDigit(s[i])){
                i++;
            }
            answer+=sign*int.parse(s.substring(startIndex,i));
            i--;
        }
      }  
    }
    return answer;
  }

  bool isDigit(String? s){
    if(s==null) return false;
    return int.tryParse(s)!=null;
  }
}
