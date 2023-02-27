import UIKit

var greeting = "Hello, playground"
//Having your new found knowledge of linked lists and stacks. Implement a queue using a linked list.
//
//A queue is a First In First Out data type (FIFO).
//Think of a queue like waiting in line. When you are in a line you are added to the back of the queue. Whoever joined the line before everyone else will leave the line first.
//Queue will need a dequeue function which removes and returns the element that has been in the queue the longest.
//Queue will need a add function which will add an element to the linked list

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

struct Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ value: T) {
        let newNode = Node(value)
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating func dequeue() -> T? {
        guard let oldHead = head else { return nil }
        head = oldHead.next
        if head == nil {
            tail = nil
        }
        return oldHead.value
    }
}

var queue = Queue<String>()
queue.enqueue("john")
queue.enqueue("rob")
queue.enqueue("tyler")
print(queue.dequeue())
print(queue.dequeue())
print(queue.dequeue())


//class Node<T> {
//  var value:T
//  var next:Node?
//  init(value:T) {
//    self.value = value
//  }
//}
//class Queue<T> {
//  var tail:Node<T>?
//  var head:Node<T>?
//  var count:Int = 0
//  func dequeue () -> Node<T>? {
//    if let node = head {
//      head = head?.next
//      count -= 1
//      return node
//    }
//    return nil
//  }
//  func enqueue(value:T) {
//    let newNode = Node(value:value)
//    if let tailNode = tail {
//      tailNode.next = newNode
//      newNode.next = nil
//      tail = newNode
//    } else {
//      head = newNode
//      tail = newNode
//    }
//    count += 1
//  }
//}
