//: Playground - noun: a place where people can play

import UIKit

/*
 有两个大小为 m 和 n 的排序数组 nums1 和 nums2 。
 
 请找出两个排序数组的中位数并且总的运行时间复杂度为 O(log (m+n)) 。
 
 示例 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 中位数是 2.0
 
 
 示例 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 中位数是 (2 + 3)/2 = 2.5
 */

/*
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */


 /*
 取巧方法
 */

//class Solution1 {
//    func findMedianSortedArrays1(_ nums1: [Int], _ nums2: [Int]) -> Double {
//        // 这里使用sorted 直接排序
//        let nums = (nums1 + nums2).sorted()
//        var median: Double = 0.0
//        let index = nums.count / 2
//        if nums.count % 2 == 0 {
//            median = Double(nums[index - 1] + nums[index]) / 2
//        } else {
//            median = Double(nums[index])
//        }
//
//        return median
//    }
//}

/*
 此题目主要考核 总的运行时间复杂度为 O(log (m+n))
 所以我们使用二分法查找 同时查找两个数组的中间值
 */

/*
 🤔
 当数组个数为奇数时 中位数： (n/2+1)
 当为偶数时 中位数：(n/2) 和 (n/2 + 1)
 
 那么两个有序的数组一起计算中位数
 利用每次对比num1 num2 中间数 用< > 排除num1左边的数或者num2右边的数
 如果相等的话就任意返回num1 中间数
 
 k = (nums1.count + nums2.count) / 2
 
 当k == 1时 就是判断两个数组中位数的最小值
 
*/

class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        
        var median: Double = 0.0
        let k = count / 2
        if count % 2 == 0 {
            median = Double((binarySearch(nums1, nums2, 0, nums1.count, 0, nums2.count, k) + binarySearch(nums1, nums2, 0, nums1.count, 0, nums2.count, k + 1))) / 2
        } else {
            median = Double(binarySearch(nums1, nums2, 0, nums1.count, 0, nums2.count, k + 1))
        }
        
        return median
    }
    
    func binarySearch(_ nums1: [Int], _ nums2: [Int], _ start1: Int, _ len1: Int, _ start2: Int, _ len2: Int, _ k: Int) -> Int {
        if len1 > len2 {
            return binarySearch(nums2, nums1, start2, len2, start1, len1, k)
        }
        
        if len1 == 0 {
            return nums2[start2 + k - 1]
        }
        
        if k == 1 {
            return min(nums1[start1], nums2[start2])
        }
        
        let p1 = min(k / 2, len1)
        let p2 = k - p1
        if nums1[start1 + p1 - 1] < nums2[start2 + p2 - 1] {
            return binarySearch(nums1, nums2, start1 + p1, len1 - p1, start2, len2, k - p1)
        } else if nums1[start1 + p1 - 1] > nums2[start2 + p2 - 1] {
            return self.binarySearch(nums1, nums2, start1, len1, start2 + p2, len2 - p2, k - p2)
        } else {
            return nums1[start1 + p1 - 1]
        }
    }
}

let nums1 = [1]
let nums2 = [3]

Solution().findMedianSortedArrays(nums1, nums2)



















