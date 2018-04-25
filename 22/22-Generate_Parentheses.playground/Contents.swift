//: Playground - noun: a place where people can play

import UIKit

/*
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 
 例如，给出 n = 3，生成结果为：
 
 [
    "((()))",
    "(()())",
    "(())()",
    "()(())",
    "()()()"
 ]
 */

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
    "((()))",
    "(()())",
    "(())()",
    "()(())",
    "()()()"
 ]
 */

/*
 递归题目需要思考三点。选择。限制。结束条件。
 
 这道题   加左括号 加右括号
 如果左括号用完就不能再加左括号
 如果已经出现的右括号和左括号一样多，则不能再加右括号了。因为那样的话新加入的右括号一定无法匹配。
 */

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var results = [String]()
        var parentheses = ""
        backtracking(parentheses, &results, n, n)
        return results
    }
    
    func backtracking(_ parentheses: String, _ results: inout [String], _ left: Int, _ right: Int) {
        if left == 0, right == 0 {
            results.append(parentheses)
            return
        }
        
        if left > 0 {
            let parent = parentheses + "("
            backtracking(parent, &results, left - 1, right)
        }
        
        if right > left {
            let parent = parentheses + ")"
            backtracking(parent, &results, left, right - 1)
        }
    }
}

print(Solution().generateParenthesis(3))
