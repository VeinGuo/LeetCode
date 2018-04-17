//: Playground - noun: a place where people can play

import UIKit

/*
编写一个函数来查找字符串数组中的最长公共前缀。
 */

/*
Write a function to find the longest common prefix string amongst an array of strings.
 */

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 1 { return strs[0] }
        let tempStrs = strs.sorted()
        var idx = 0
        var result = ""
        let chars = Array(tempStrs[0])
        let chars1 = Array(tempStrs[tempStrs.count - 1])
        while idx < chars.count - 1 {
            if chars[idx] == chars1[idx] {
                result += String(chars[idx])
            } else {
                return result
            }
            idx += 1
        }
        return result
    }
}

Solution().longestCommonPrefix(["a","a","b"])

