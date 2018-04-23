//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
 
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 
 
 示例:
 
 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
 */

/*
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.
 
 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
 
 
 
 Example:
 
 Input: "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Note:
 
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

class Solution {
    func letterCombinations(_ digits: String) -> [String] {

        let nums = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        var results = [String]()
        var result = ""
        depthSearch(nums, &results, &result, Array(digits), 0)
        return results
    }
    
    func depthSearch(_ nums: [String], _ results: inout [String], _ result: inout String, _ digits: [Character], _ index: Int) {
        if digits.count == index {
            if result != "" {
                results.append(result)
            }
            return
        }
        
        let str = nums[Int(String(digits[index]))!]
        print("index: \(String(digits[index]))")
        print(str)
        for char in str {
            print("char: \(char)")
            result.append(char)
            depthSearch(nums, &results, &result, digits, index + 1)
            result.removeLast()
        }
    }
}

print(Solution().letterCombinations("23"))
