//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个字符串，找出不含有重复字符的 最长子串 的长度。
 
 示例：
 
 给定 "abcabcbb" ，没有重复字符的最长子串是 "abc" ，那么长度就是3。
 
 给定 "bbbbb" ，最长的子串就是 "b" ，长度是1。
 
 给定 "pwwkew" ，最长子串是 "wke" ，长度是3。请注意答案必须是一个子串，"pwke" 是 子序列 而不是子串。
 */

/*
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

/*
 子序列 与 子串区别
 
 例如：一个字符串   awbcdewgh
 
 他的子串：  awbc.   awbcd   awbcde   ....很多个子串  但是都是连续在一起
 
 他的子序列： abc  .  abcd    abcde  ...  很多个子序列  但是子序列中的字符在字符串中不一定是连在一起的， 但是  子序列一定是单调的， （即字符之间ASCII单调递增或单调递减）
 */

/*
    🤔思路：
        提供一个从0位开始的位置标记 nowIndex
        创建一个字典存放重复字符最后出现 key = 字符  value = 字符所在位置
        for in 字符串数组
 
        以 abcabcbb 为例子
        取出字符串数组第一位a，a未包含在字典中，就存入字典
        可以看到 当循环到位置为3时出现第二个a重复字符
        nowIndex 从0 移动到当前重复字符的位置的下一位前面的字符抛弃剩下
        a b c a b c b b
                ↑
             nowIndex
        接下来再循环出现第二个b重复字符 nowIndex再次移动到重复字符的下一位
        a b c a b c b b
                  ↑
               nowIndex
 
        .......
 
        到最后一个重复字符b出现 nowIndex再次移动到
        a b c a b c b b
                       ↑
                    nowIndex
 
        字典中存储
        ["b": 7, "a": 3, "c": 5]
        存储的是有出现重复的字符的最后出现的位置
        上面出现重复字符串位置为3 4 5 6 7
        我们需要计算最长子串，所以需要再设置maxLength来计算最长子串长度
        每次没出现重复的字符时就需要计算字符串长度。
        也就是循环当前位置index - nowIndex + 1下一位 即后续没出现的长度
        因为需要的是最长的子串所以都需要max函数选取最大值
 
        发现"tmmzuxt" 出现计算错误
        输出是 zuxt 4位 但不是最长的因为少算了m
        所以也就是在重复的字符也需要算，也是取最大值
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else { return 0 }
        let characters = Array(s)
        var dict = [String: Int]()
        var nowIndex = 0
        var maxLength = 0
        for (index, value) in characters.enumerated() {
            let v = String(value)
            if let idx = dict[v] {
                nowIndex = max(idx + 1, nowIndex)
                maxLength = max((index - nowIndex + 1), maxLength)
            } else {
                maxLength = max((index - nowIndex + 1), maxLength)
            }
            dict[v] = index
        }
        return maxLength
    }
}

Solution().lengthOfLongestSubstring("tmmzuxt")

