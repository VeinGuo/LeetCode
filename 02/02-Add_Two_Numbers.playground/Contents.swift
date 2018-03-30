//: Playground - noun: a place where people can play

import UIKit

/*
 给定两个非空链表来代表两个非负数，位数按照逆序方式存储，它们的每个节点只存储单个数字。将这两数相加会返回一个新的链表。
 
 你可以假设除了数字 0 之外，这两个数字都不会以零开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
/* 解析
    链表按照逆序方式存储
    相加超过10 当前为的后位需要加1
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // 补齐节点 假设一个为2个节点 另一个为3个节点 及把第一个的链表补助第3个节点为0
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        
        let value = (l1!.val + l2!.val)
        let result = ListNode(value % 10)
        result.next = addTwoNumbers(l1?.next, l2?.next)
        if value >= 10 {
            result.next = addTwoNumbers(ListNode(value / 10), result.next)
        }
        return result
    }
}
