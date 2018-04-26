//: Playground - noun: a place where people can play

import UIKit

/*
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 
 示例:
 
 输入:
 [
    1->4->5,
    1->3->4,
    2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 */

/*
 Merge k sorted linked lists and return it as one sorted list. Analyze and describe its complexity.
 
 Example:
 
 Input:
 [
    1->4->5,
    1->3->4,
    2->6
 ]
 Output: 1->1->2->3->4->4->5->6
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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        var count = lists.count
        var results = lists
        while count > 1 {
            let mid = (count + 1) / 2
            for i in 0..<count / 2 {
                results[i] = mergeTwoLists(results[i], results[mid + i])
            }
            count = mid
        }
        return results[0]
    }
    
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
l1.next = ListNode(4)
l1.next?.next = ListNode(5)

let l2 = ListNode(1)
l2.next = ListNode(3)
l2.next?.next = ListNode(4)

let l3 = ListNode(2)
l3.next = ListNode(6)

Solution().mergeKLists([l1, l2, l3])
