//: Playground - noun: a place where people can play

import UIKit

/*
 
 判断一个整数是否是回文数。不能使用辅助空间。
 
 点击查看提示
 
 一些提示:
 
 负整数可以是回文数吗？（例如 -1）
 
 如果你打算把整数转为字符串，请注意不允许使用辅助空间的限制。
 
 你也可以考虑将数字颠倒。但是如果你已经解决了 “颠倒整数” 问题的话，就会注意到颠倒整数时可能会发生溢出。你怎么来解决这个问题呢？
 
 本题有一种比较通用的解决方式。
 */

/*
 Determine whether an integer is a palindrome. Do this without extra space.
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        var a = x
        var k = 1
        while x / k >= 10  {
            k *= 10
        }

        while a > 0 {
            let high = a / k
            let low = a % 10
            if high != low {
                return false
            } else {
                a = a % k / 10
                k /= 100
            }
        }

        return true
    }
}

Solution().isPalindrome(1221)


