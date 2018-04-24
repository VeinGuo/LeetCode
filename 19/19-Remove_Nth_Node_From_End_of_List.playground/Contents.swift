//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 示例：
 
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：
 
 给定的 n 保证是有效的。
 
 进阶：
 
 你能尝试使用一趟扫描实现吗？
 */

/*
 Given a linked list, remove the n-th node from the end of list and return its head.
 
 Example:
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 
 Given n will always be valid.
 
 Follow up:
 
 Could you do this in one pass?
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard head != nil else { return head }
        let result = ListNode(0)
        result.next = head
        // 定义两个指针都指向head
        var iNode = result
        var jNode = result
        // jNode 遍历 n位
        for _ in 0..<n {
            jNode = jNode.next!
            print(jNode.val)
        }
        // 这里其实就是 单链表长度length - n 的循环iNode的位置就是要删除的节点的前一位
        while jNode.next != nil {
            iNode = iNode.next!
            print("iNode: \(iNode.val)")
            jNode = jNode.next!
            print("jNode: \(jNode.val)")
            print("-------------------")
        }

        iNode.next = iNode.next?.next
        return result.next
    }
}

let l1 = ListNode(1)
l1.next = ListNode(2)
l1.next?.next = ListNode(3)
l1.next?.next?.next = ListNode(4)
l1.next?.next?.next?.next = ListNode(5)

Solution().removeNthFromEnd(l1, 2)
