//: Playground - noun: a place where people can play

import UIKit

/*
 给定 n 个正整数 a1，a2，...，an，其中每个点的坐标用（i, ai）表示。 画 n 条直线，使得线 i 的两个端点处于（i，ai）和（i，0）处。请找出其中的两条直线，使得他们与 X 轴形成的容器能够装最多的水。
 
 
 
 注意：你不能倾斜容器，n 至少是2。
 */

/*
 Given n non-negative integers a1, a2, ..., an, where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of line i is at (i, ai) and (i, 0). Find two lines, which together with x-axis forms a container, such that the container contains the most water.
 
 Note: You may not slant the container and n is at least 2.
 */

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count >= 2 else { return 0 }
        var result = 0
        var len = height.count - 1
        var start = 0
        
        while start < len {
            let w = len - start
            let h = min(height[start], height[len])
            result = max(result, w * h)
            if height[start] > height[len] {
                len -= 1
            } else {
                start += 1
            }
        }
        
        return result
    }
}

Solution().maxArea([1, 3, 2])
