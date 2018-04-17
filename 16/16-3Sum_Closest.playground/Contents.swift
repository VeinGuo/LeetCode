//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 
 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
 */

/*
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target. Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 Example:
 
 Given array nums = [-1, 2, 1, -4], and target = 1.
 
 The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
 */

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else { return 0 }

        var minDiff = Int32.max
        var result = 0
        let sortedNums = nums.sorted()
        
        let count = sortedNums.count - 2
        var i = 0
        while i < count {
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
               let sum = sortedNums[left] + sortedNums[right] + sortedNums[i]
                let diff = abs(sum - target)
                if minDiff > diff {
                    result = sum
                    minDiff = Int32(diff)
                } else if sum < target {
                    left += 1
                } else if sum > target {
                    right -= 1
                } else {
                    return result
                }
            }
            i += 1
        }
        return result
    }
}

Solution().threeSumClosest([-1, 2, 1, -4], 1)
