//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 
 示例:
 
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 说明:
 
 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 */

/*
 Given a linked list, swap every two adjacent nodes and return its head.
 
 Example:
 
 Given 1->2->3->4, you should return the list as 2->1->4->3.
 Note:
 
 Your algorithm should use only constant extra space.
 You may not modify the values in the list's nodes, only nodes itself may be changed.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var head = head
        if head == nil || head?.next == nil { return head }
        let i = head?.next
        head?.next = swapPairs(head?.next?.next)
        i?.next = head
        return i
    }
}

let l1 = ListNode(1)
l1.next = ListNode(2)
l1.next?.next = ListNode(3)
l1.next?.next?.next = ListNode(4)

var l2 = Solution().swapPairs(l1)

print(l2?.val)
while l2?.next != nil {
    l2 = l2?.next
    print(l2?.val)
}

