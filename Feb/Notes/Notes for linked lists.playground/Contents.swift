import UIKit


class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

let node1 = Node(value: "Node 1")
let node2 = Node(value: "Node 2")
node1.next = node2
let node3 = Node(value: "Node 3")
node2.next = node3

/// stack
///

class Stack<T> {
    var head: Node<T>?
    
    // push (object) -> Void
    func push(value: T) {
        let node = Node(value: value)
        node.next = head
        self.head = node
    }
    
    // pop // takes an item out () -> Node
    func pop() -> Node<T>? {
        if let oldHead = head {
            self.head = oldHead.next
            return oldHead
        }
        return nil
    }
    
    // peek () -> Node { return head }
    func peek() -> Node<T>? {
        return head
    }
}

let stack = Stack<String>()

stack.push(value: "1")
stack.push(value: "2")
stack.push(value: "3")

print(stack.peek()?.value)

print(stack.pop()?.value)

print(stack.peek()?.value)


stack.push(value: "Tomato")

print(stack.peek()?.value)
print(stack.pop()?.value)
print(stack.peek()?.value)
