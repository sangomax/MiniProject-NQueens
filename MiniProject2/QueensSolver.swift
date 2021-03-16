//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var count2 = 0
func solveQueens(board: inout Board) {
    solveQueensAllWaysHelper(board: &board, numQueen: 0, startCol: 0)
    print("... \(count2) possible ways")
    print()
    solveQueensHelper(board: &board, numQueen: 0, startCol: 0)
    
    
}

func solveQueensAllWaysHelper(board: inout Board, numQueen: Int, startCol: Int) {
    var maxQueenOnBoardSameTime = 0
    if (numQueen == board.size) {
        count2 += 1
        print(board.description)
    } else {
        for col in (startCol)...(board.size - 1) {
            if(col == numQueen) {
                for row in 0...(board.size - 1) {
                    if board.isSafe(row: row, col: col) {
                        if(col + 1 < board.size || numQueen == (board.size - 1)) {
                            board.place(row: row, col: col)
                            solveQueensAllWaysHelper(board: &board, numQueen: numQueen + 1, startCol: col + 1)
                            board.remove(row: row, col: col)
                        } else {
                            return
                        }
                    }
                }
            }
        }
    }
}


func solveQueensHelper(board: inout Board, numQueen: Int, startCol: Int) -> Int {
    var maxQueenOnBoardSameTime = 0
    if (numQueen == board.size) {
        print(board.description)
        print("Number of recursive calls: \(count)")
        return numQueen
    } else {
        for col in (startCol)...(board.size - 1) {
            if(col == numQueen) {
                for row in 0...(board.size - 1) {
                    if board.isSafe(row: row, col: col) {
                        if(col + 1 < board.size || numQueen == (board.size - 1)) {
                            count += 1
                            board.place(row: row, col: col)
                            maxQueenOnBoardSameTime = solveQueensHelper(board: &board, numQueen: numQueen + 1, startCol: col + 1)
                            
                            board.remove(row: row, col: col)
                        } else {
                            return maxQueenOnBoardSameTime
                        }
                    }
                    if maxQueenOnBoardSameTime == board.size {
                        return maxQueenOnBoardSameTime
                    }
                }
            }
        }
        
        
    }
    
    return maxQueenOnBoardSameTime
}



