/// D: Dependency inversion Priciple
/// High-level modules should not depend on low level modules,
/// Both should depend on abstraction (e.g., interface)

abstract class Storage{
  void saveData(String data);
}

class DataBaseStorage extends Storage{
  @override
  void saveData(String data) {
    print("stored data in mongo db");
  }
}

class FileStorage extends Storage{
  final String filePath;
  FileStorage({required this.filePath});

  @override
  void saveData(String data) {
    print("stored data in file of following filepath: $filePath");
  }
}

class DataProcessor{
  final Storage storage;
  DataProcessor(this.storage);
  void processData(String data){
    storage.saveData(data);
  }
}

void main(List<String> args) {
  DataProcessor bdStorage = DataProcessor(DataBaseStorage());
  DataProcessor fileStorage = DataProcessor(FileStorage(filePath: "emulated/0/android/"));
 bdStorage.processData("someData");
 fileStorage.processData("somedata"); 
}