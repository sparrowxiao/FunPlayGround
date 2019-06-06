/*
 You’re given the pointer to the head node of a linked list, an integer to add to the list and the position at which the integer must be inserted. Create a new node with the given integer, insert this node at the desired position and return the head node.
 
 A position of 0 indicates head, a position of 1 indicates one node away from the head and so on. The head pointer given may be null meaning that the initial list is empty.
 
 As an example, if your list starts as  and you want to insert a node at position  with , your new list should be
 
 Function Description Complete the function insertNodeAtPosition in the editor below. It must return a reference to the head node of your finished list.
 
 insertNodeAtPosition has the following parameters:
 
 head: a SinglyLinkedListNode pointer to the head of the list
 data: an integer value to insert as data in your new node
 position: an integer position to insert the new node, zero based indexing
 Input Format
 
 The first line contains an integer , the number of elements in the linked list.
 Each of the next  lines contains an integer SinglyLinkedListNode[i].data.
 The last line contains an integer .
 

 */


import Foundation

/*
 * For your reference:*/

 class SinglyLinkedListNode {
      var data: Int
      var next: SinglyLinkedListNode?
    
    init( data:Int) {
        self.data = data
    }
  }

 
func insertNodeAtPosition(head: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    
    var currentNode = head;
    
    // insert position at index 0
    if position == 0 {
        head?.data = data
        head?.next = currentNode
        return head
    }
    
    // insert position >=1
    var currentPosition = 1 ;// to start
    currentNode = head?.next
    while(currentNode != nil){
        if position != currentPosition {
            currentNode = currentNode?.next
            currentPosition += 1
        }else{
            let tempNode = currentNode
            currentNode?.data = data
            currentNode?.next = tempNode
        }
    }
    return head
}

// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
    let sortedsocks = ar.sorted(by:<)
    //the start point to check the sorted array
    var checkpoint : Int = 0
    var num_pair : Int = 0
    while (checkpoint < n-1){
        if(sortedsocks[checkpoint] == sortedsocks[checkpoint+1]){
            checkpoint += 2
            num_pair += 1
        }
        else {checkpoint += 1}
    }
    return num_pair
}

let n:Int = 9
let ar:[Int]  = [10,20,20,10,10,30,50,10,20]
let result = sockMerchant(n: n, ar: ar)


