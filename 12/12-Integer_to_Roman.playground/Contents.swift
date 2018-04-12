//: Playground - noun: a place where people can play

import UIKit

/*
 给定一个整数，将其转为罗马数字。
 
 输入保证在 1 到 3999 之间。
 */

/*
 Given an integer, convert it to a roman numeral.
 
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

class Solution {
    func intToRoman(_ num: Int) -> String {
        guard num >= 1, num <= 3999 else { return "" }
        var tmp = num
        var result = ""
        var index = 0
// Ⅰ（1）、Ⅴ（5）、Ⅹ（10）、Ⅼ（50）、Ⅽ（100）、Ⅾ（500）和Ⅿ（1000）
//    左减的数字有限制，仅限于I、X、C。比如45不可以写成VL，只能是XLV
//        let roman = ["I", "IV", "V", "IX", "X", "XL", "L", "XC", "C", "CD", "D", "CM", "M"]
        let roman = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

        let nums = [1000, 900, 500, 400, 100, 90, 50 , 40, 10, 9, 5, 4, 1]
        for (index, value) in nums.enumerated() {
            while tmp >= nums[index] {
                tmp -= nums[index]
                result += roman[index]
            }
        }

        return result
    }

    func intToChar(_ num: Int) -> String {
        switch num {
        case 1:
            return "I"
        case 4:
            return "IV"
        case 5:
            return "V"
        case 9:
            return "IX"
        case 10:
            return "X"
        case 40:
            return "XL"
        case 50:
            return "L"
        case 90:
            return "XC"
        case 100:
            return "C"
        case 400:
            return "CD"
        case 500:
            return "D"
        case 900:
            return "CM"
        case 1000:
            return "M"
        default:
            return ""
        }
    }
}

Solution().intToRoman(45)
