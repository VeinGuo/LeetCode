//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个罗马数字，将其转换成整数。
 
 返回的结果要求在 1 到 3999 的范围内。
 */

/*
 Given a roman numeral, convert it to an integer.
 
 Input is guaranteed to be within the range from 1 to 3999.
 */


/*
 https://zh.wikipedia.org/wiki/%E7%BD%97%E9%A9%AC%E6%95%B0%E5%AD%97
 罗马数字共有7个，即Ⅰ（1）、Ⅴ（5）、Ⅹ（10）、Ⅼ（50）、Ⅽ（100）、Ⅾ（500）和Ⅿ（1000）
 重复数次：一个罗马数字重复几次，就表示这个数的几倍。
 右加左减：
 在较大的罗马数字的右边记上较小的罗马数字，表示大数字加小数字。
 在较大的罗马数字的左边记上较小的罗马数字，表示大数字减小数字。
 左减的数字有限制，仅限于I、X、C。比如45不可以写成VL，只能是XLV
 但是，左减时不可跨越一个位值。比如，99不可以用IC（100-1）表示，而是用XCIX（ [100-10]+[10-1]）表示。（等同于阿拉伯数字每位数字分别表示。）
 左减数字必须为一位，比如8写成VIII，而非IIX。
 右加数字不可连续超过三位，比如14写成XIV，而非XIIII。（见下方“数码限制”一项。）
 加线乘千：
 在罗马数字的上方加上一条横线或者加上下标的Ⅿ，表示将这个数乘以1000，即是原数的1000倍。
 同理，如果上方有两条横线，即是原数的1000000（1000^{{2}}）倍。
 数码限制：
 同一数码最多只能连续出现三次，如40不可表示为XXXX，而要表示为XL。
 例外：由于IV是古罗马神话主神朱庇特（即IVPITER，古罗马字母里没有J和U）的首字，因此有时用IIII代替IV。
 */
// I、X、C 左边只能用三个 左边是减去
// Ⅰ（1）、Ⅴ（5）、Ⅹ（10）、Ⅼ（50）、Ⅽ（100）、Ⅾ（500）和Ⅿ（1000
class Solution {
    func romanToInt(_ s: String) -> Int {
        let romanMap = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let characters = Array(s)
        var result = 0
        var index = 0
        while index < characters.count - 1 {
            let x = String(characters[index])
            print(x)
            let y = String(characters[index + 1])
            if charTocInt(x) >= charTocInt(y) {
                let roman = String(characters[index])
                if let num = romanMap[roman] {
                   result += num
                }
            } else {
                let roman = String(characters[index])
                if let num = romanMap[roman] {
                    result -= num
                }
            }
            index += 1
        }
        if let lastRoman = characters.last,
            let last = romanMap[String(lastRoman)] {
            result += last
        }
        
        return result
    }
    
    func charTocInt(_ char: String) -> Int {
        switch char {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default: fatalError("error")
        }
    }
}

Solution().romanToInt("XLV")
