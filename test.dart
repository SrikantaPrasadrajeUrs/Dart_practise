void main() {
  ///(@[^@]+@) matches a key that starts and ends with @, and it captures this key.
  // (.*?) matches any content between the two occurrences of the key, as little as possible.
  // (\1) ensures that the exact same key is repeated after the content.
  // The string that contains keys to be replaced
  String input = '''<p>@test1@hi bro@test1@</p><p>@dontreplace@deal@dontreplace@</p><p><br></p><p><table border="1" style="border-collapse: collapse; border-spacing: 0; width: 100%;display:table;table-layout:fixed; margin-top: 10px; margin-bottom: 10px;"></table></p>''';

  // The data with keys and their corresponding replacement values
  Map<String, (bool,dynamic)> data = {
    '@dontreplace@': (false,"tesla"),
    '@test1@': (true,"razorPay"),
  };

  // Regular expression to match keys surrounded by @
  RegExp regex = RegExp(r'(@[^@]+@)(.*?)(\1)');

  // Replace content between matching keys
  String result = input.replaceAllMapped(regex, (match) {
    String key = match.group(1)??"";
    var val = data[key];
    String value = val?.$1==true? val?.$2??"--":"--";
    return value;
  });

  print(result);
}
