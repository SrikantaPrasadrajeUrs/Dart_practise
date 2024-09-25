import 'dart:math' as m;
class ListNode {
  int val;
  ListNode? left;
  ListNode? right;
  
  ListNode(this.val, [this.left, this.right]);
}
int i = 1;
void main(List<String> args) {
  
  // Creating a simple binary tree with 10 elements

  // Leaf nodes
  ListNode node8 = ListNode(1);
  ListNode node9 = ListNode(3);
  ListNode node10 = ListNode(6);
  ListNode node11 = ListNode(9);
  ListNode node12 = ListNode(12);
  ListNode node13 = ListNode(17);
  ListNode node14 = ListNode(20);
  
  // Subtree nodes
  ListNode node4 = ListNode(2, node8, node9); // Node with value 2 has left child 1 and right child 3
  ListNode node5 = ListNode(7, node10, node11); // Node with value 7 has left child 6 and right child 9
  ListNode node6 = ListNode(15, node12, node13); // Node with value 15 has left child 12 and right child 17
  ListNode node7 = ListNode(19, node14); // Node with value 19 has only left child 20

  // Root level
  ListNode node2 = ListNode(5, node4, node5); // Node with value 5 has left and right subtrees
  ListNode node3 = ListNode(18, node6, node7); // Node with value 18 has left and right subtrees
  
  // Root node
  ListNode head = ListNode(10, node2, node3); // Root node has left subtree rooted at 5 and right subtree rooted at 18

  // This is the binary tree structure:
  //              10
  //            /    \
  //           5      18
  //         /  \    /  \
  //        2    7  15  19
  //       / \  / \  / \   \
  //      1  3 6  9 12 17  20
var l = findTotalSum(head);
print(l);
}
int largest=0;

void findLargestSum(ListNode? head,int total){
    if(head==null){
      return;
    }
    total+=head.val;
    findLargestSum(head.left,total);
    findLargestSum(head.right,total);
    if(largest<total){
      largest=total;
    }
}

int findTotalSum(ListNode? head) {
  if (head == null) {
    return 0;
  }

  int leftSum = findTotalSum(head.left);
  int rightSum = findTotalSum(head.right);

  return head.val + leftSum+ rightSum;
}

int max(int a, int b, int c) {
  return m.max(m.max(a, b), c);
}
