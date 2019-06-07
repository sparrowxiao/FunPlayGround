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
public class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?
    
    public init(nodeData: Int) {
        self.data = nodeData
    }
}

public class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?
    
    public init() {}
    
    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }
    
    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }
        
        tail = node
    }
}
/*
 public class SinglyLinkedListNode {
     public var data: Int
     public var next: SinglyLinkedListNode?
    
     public init( data:Int) {
        self.data = data
    }
  }*/

func printSinglyLinkedList(head: SinglyLinkedListNode? ) {
    var node = head
    
    while node != nil {
        print("\(node?.data) ")
        node = node!.next
        
        
    }
}

func insertNodeAtPosition(llist: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    
    var currentNode:SinglyLinkedListNode? = llist
    var currentPosition:Int = 0 // to start
    let newNode: SinglyLinkedListNode = SinglyLinkedListNode(nodeData:data)
   
    
    while(currentNode != nil){
        if position == currentPosition+1 {
            newNode.next = currentNode?.next
            currentNode!.next = newNode
            break
            
        }else{
            
            currentNode = currentNode?.next
            currentPosition += 1
        }
    }
    return llist


    
}

var llist = SinglyLinkedList()
//list is 16 13 7
llist.insertNode(nodeData: 16)
llist.insertNode(nodeData: 13)
llist.insertNode(nodeData: 7)

//
guard let data:Int = 1
    else{print("Bad input")}


guard let position:Int = 2
    else{print("Bad input")}

let llist_head = insertNodeAtPosition(llist: llist.head!, data: data, position: position)

printSinglyLinkedList(head:llist_head)
