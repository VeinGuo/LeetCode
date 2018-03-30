//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个整数数列，找出其中和为特定值的那两个数。
 你可以假设每个输入都只会有一种答案，同样的元素不能被重用。
 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */

/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 Example:
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        var result = [Int]()
        for (index, value) in nums.enumerated() {
            let tmp = target - value
            if let idx = dic[tmp] {
                result.append(index)
                result.append(idx)
            } else {
                dic[value] = index
            }
        }
        return result
    }
}

let nums = [2, 7, 11, 15]
let target = 9
let solution = Solution()
print(solution.twoSum(nums, target))

