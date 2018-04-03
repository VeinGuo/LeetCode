//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个范围为 32 位 int 的整数，将其颠倒。
 
 例 1:
 
 输入: 123
 输出:  321
 
 
 例 2:
 
 输入: -123
 输出: -321
 
 
 例 3:
 
 输入: 120
 输出: 21
 
 
 注意:
 
 假设我们的环境只能处理 32 位 int 范围内的整数。根据这个假设，如果颠倒后的结果超过这个范围，则返回 0。
 */

/*
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output:  321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */

class Solution {
    func reverse(_ x: Int) -> Int {
        var temp = abs(x)
        var result = 0
        while temp > 0 {
            result *= 10
            result += temp % 10
            temp /= 10
            if result > Int32.max {
                return 0
            }
        }
        
        return x >= 0 ? result : -result
    }
}

Solution().reverse(-1000005)
