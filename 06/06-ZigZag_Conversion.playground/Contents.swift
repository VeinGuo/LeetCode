//: Playground - noun: a place where people can play

import UIKit

/*
 将字符串 "PAYPALISHIRING" 以Z字形排列成给定的行数：（下面这样的形状）
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 之后按逐行顺序依次排列："PAHNAPLSIIGYIR"
 
 
 
 实现一个将字符串进行指定行数的转换的函数:
 
 string convert(string text, int nRows);
 convert("PAYPALISHIRING", 3) 应当返回 "PAHNAPLSIIGYIR" 。
 */

/*
 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"
 Write the code that will take a string and make this conversion given a number of rows:
 
 string convert(string text, int nRows);
 convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
 */

/*
 🤔
 等差数列 每个差 numRows * 2 - 2
 
 取出以后还缺少每个同一列的单个字符
 i > 0, i < numRows - 1 去掉头和尾
 取中间 同一列的单个字符
 difference - i * 2 + j
 */

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count > 1, numRows > 1 else {
            return s
        }
        let characters = Array(s)
        let difference = numRows * 2 - 2
        var result = ""
        var i = 0
        while i < numRows {
            var j = i
            while j < s.count {
                result += String(characters[j])
                if i > 0, i < numRows - 1 {
                    let k = difference - i * 2 + j
                    if k < s.count {
                        result += String(characters[k])
                    }
                }
                j += difference
            }
            i += 1
        }
        return result
    }
}

Solution().convert("ABCDEFG", 4)
