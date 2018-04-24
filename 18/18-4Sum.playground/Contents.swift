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
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [] }
        if nums.count == 4, nums[0] + nums[1] + nums[2] + nums[3] == 0 {
            return [nums]
        }
        var result = [[Int]]()
        let sortedNums = nums.sorted()
        let count = sortedNums.count
        var i = 0
        while i < count - 3 {
            var k = i + 1
            if i > 0, sortedNums[i - 1] == sortedNums[i] {
                i += 1
                continue
            }
            while k < count - 2 {
                if k > i + 1, sortedNums[k - 1] == sortedNums[k] {
                    k += 1
                    continue
                }
                var left = k + 1
                var right = sortedNums.count - 1
                while left < right {
                    let sum = sortedNums[left] + sortedNums[right] + sortedNums[i] + sortedNums[k]
                    if sum == target {
                        result.append([sortedNums[left], sortedNums[right], sortedNums[i], sortedNums[k]])
                        while left < right && sortedNums[left] == sortedNums[left + 1] {
                            left += 1
                        }
                        
                        while left < right && sortedNums[right] == sortedNums[right - 1] {
                            right -= 1
                        }
                        
                        left += 1
                        right -= 1
                    } else if sum < target {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
                k += 1
            }
            i += 1
        }
        return result
    }
}

print(Solution().fourSum([-1, -5, -5, -3, 2, 5, 0, 4], -7))



