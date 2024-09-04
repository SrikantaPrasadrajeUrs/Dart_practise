import 'dart:io';

void main(List<String> args) {
  File file =  File("hello.text");

  // read contents
  print(file.readAsStringSync());

  // read size
  print("size ${file.lengthSync()}");

  // last modified
  print("last modified ${file.lastModifiedSync()}");

  // delete
  print(file.delete());
  
}