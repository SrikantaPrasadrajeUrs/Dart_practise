void mergeSort(List<int> arr) {
  if (arr.length <= 1) {
    return; // Base case: A list of one or zero elements is already sorted.
  }

  int mid = arr.length ~/ 2;

  // Split the list into two halves
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  // Recursively sort both halves
  mergeSort(left);
  mergeSort(right);

  // Merge the sorted halves back together
  merge(arr, left, right);
}

void merge(List<int> arr, List<int> left, List<int> right) {
  int i = 0, j = 0, k = 0;

  // Merge the two lists into the original list
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      arr[k++] = left[i++];
    } else {
      arr[k++] = right[j++];
    }
  }

  // Copy any remaining elements from left or right
  while (i < left.length) {
    arr[k++] = left[i++];
  }
  while (j < right.length) {
    arr[k++] = right[j++];
  }
}

void main() {
  List<int> arr = [38, 27, 43, 3, 9, 82, 10];
  Map<String,dynamic> map = {
    "1-":{"1":2,"2":2},
    "2-":{"1":2,"2":2,"3":3}
  };
  // print(map.entries.toList().reversed);
  print("Original list: $arr");
  mergeSort(arr);
  print("Sorted list: $arr");
}
