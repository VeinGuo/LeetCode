//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
    [-1, 0, 1],
    [-1, -1, 2]
 ]
 */

/*
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note:
 
 The solution set must not contain duplicate triplets.
 
 Example:
 
 Given array nums = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
    [-1, 0, 1],
    [-1, -1, 2]
 ]
 */

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        if nums.count == 3, nums[0] + nums[1] + nums[2] == 0 {
            return [nums]
        }
        var result = [[Int]]()
        let sortedNums = nums.sorted()
        
        let count = sortedNums.count - 2
        var i = 0
        while i < count {
            // 和前一位相同 也跳过
            if i > 0, sortedNums[i] == sortedNums[i - 1] {
                i += 1
                continue
            }
            var left = i + 1
            var right = sortedNums.count - 1
            let sum = 0 - sortedNums[i]
            while left < right {
                if sortedNums[left] + sortedNums[right] == sum {
                    result.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    // 循环移动指针 去掉重复项
                    while left < right && sortedNums[left] == sortedNums[left + 1] {
                        left += 1
                    }
                    // 循环移动指针 去掉重复项
                    while left < right && sortedNums[right] == sortedNums[right - 1] {
                        right -= 1
                    }

                    left += 1
                    right -= 1
                } else if sortedNums[left] + sortedNums[right] < sum {
                    left += 1
                } else {
                    right -= 1
                }
            }
            i += 1
        }
        return result
    }
}

Solution().threeSum([-2,0,0,2,2])
