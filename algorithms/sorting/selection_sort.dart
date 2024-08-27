void main(List<String> args) {
  List<int> myVals = [1, 102, 2, 88, 4, 3, 7, 4];
  // myVals = selectionSort(myVals, SortOrder.descending) as List<int>;
  myVals = bubbleSort(myVals) as List<int>;
  print(myVals);
}

enum SortOrder { ascending, descending }

List<num> selectionSort(List<num> arr, SortOrder order) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    int min_idx = i;
    for (int j = i + 1; j < n; j++) {
      if (order == SortOrder.descending && arr[j] > arr[min_idx])
        min_idx = j;
      else if (order == SortOrder.ascending && arr[j] < arr[min_idx])
        min_idx = j;
    }
    num temp = arr[min_idx];
    arr[min_idx] = arr[i];
    arr[i] = temp;
  }
  return arr;
}

List<num> bubbleSort(List<num> nums) {
  int n = nums.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = i + 1; j < n; j++) {
      if (nums[i] < nums[j]) {
        num temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
      }
    }
  }
  return nums;
}
