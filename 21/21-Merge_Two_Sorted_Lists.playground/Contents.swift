//: Playground - noun: a place where people can play

import UIKit

/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */

/*
 Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.
 
 Example:
 
 Input: 1->2->4, 1->3->4
 Output: 1->1->2->3->4->4
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
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        
        if l1!.val > l2!.val {
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        } else {
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }
    }
}

let l1 = ListNode(1)
l1.next = ListNode(2)
l1.next?.next = ListNode(4)

let l2 = ListNode(1)
l2.next = ListNode(3)
l2.next?.next = ListNode(4)

var l3 = Solution().mergeTwoLists(l1, l2)
print(l3?.val)
while l3?.next != nil {
    l3 = l3?.next
    print(l3?.val)
}

