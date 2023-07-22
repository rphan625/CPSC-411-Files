//
//  ContentView.swift
//  Connect4
//
//  Created by csuftitan on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var gameRunning = true

    
    @State var board = [[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]]
    
    func win(col: Int, row: Int) {
        if board[col][row] == 1 { // check vertically
            if board[col + 1][row] == 1 {
                if board[col + 2][row] == 1 {
                    if board[col + 3][row] == 1 {
                        gameRunning = false
                    }
                }
            }
        }
        
        else if board[col][row] == 1 { // check horizontally
            if board[col][row + 1] == 1 {
                if board[col][row + 2] == 1 {
                    if board[col][row + 3] == 1 {
                        gameRunning = false
                    }
                }
            }
        }
        
        else if board[col][row] == 1 { // check diagonally bottom left to top right
            if board[col-1][row+1] == 1 {
                if board[col-2][row+2] == 1 {
                    if board[col-3][row+2] == 1 {
                        gameRunning = false
                    }
                }
            }
        }
        
        else if board[col][row] == 1 { // check diagonally top left to bottom right
            if board[col+1][row+1] == 1 {
                if board[col+2][row+2] == 1 {
                    if board[col+3][row+2] == 1 {
                        gameRunning = false
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("\(gameRunning ? "True" : "False")")
            HStack {
                VStack {
                    Button("1") {
                        if let i = board[0].lastIndex(of: 0) {
                            board[0][i] = 1
                            win(col: 0, row: i)
                        }
                    }
                    ForEach(board[0], id: \.self) { element in
                        Text("\(element)")
                    }
                }
                VStack {
                    Button("2") {
                        if let i = board[1].lastIndex(of: 0) {
                            board[1][i] = 1
                            win(col: 1, row: i)
                        }
                    }
                    ForEach(board[1], id: \.self) { element in
                        Text("\(element)")
                    }
                }
                VStack {
                    Button("3") {
                        if let i = board[2].lastIndex(of: 0) {
                            board[2][i] = 1
                            win(col: 2, row: i)
                        }
                    }
                    ForEach(board[2], id: \.self) { element in
                        Text("\(element)")
                    }
                }
                VStack {
                    Button("4") {
                        if let i = board[3].lastIndex(of: 0) {
                            board[3][i] = 1
                            win(col: 3, row: i)
                        }
                    }
                    ForEach(board[3], id: \.self) { element in
                        Text("\(element)")
                    }
                }
                VStack {
                    Button("5") {
                        if let i = board[4].lastIndex(of: 0) {
                            board[4][i] = 1
                            win(col: 4, row: i)
                        }
                    }
                    ForEach(board[4], id: \.self) { element in
                        Text("\(element)")
                    }
                }
                VStack {
                    Button("6") {
                        if let i = board[5].lastIndex(of: 0) {
                            board[5][i] = 1
                            win(col: 5, row: i)
                        }
                    }
                    ForEach(board[5], id: \.self) { element in
                        Text("\(element)")
                    }
                }
                VStack {
                    Button("7") {
                        if let i = board[6].lastIndex(of: 0) {
                            board[6][i] = 1
                            win(col: 6, row: i)
                        }
                    }
                    ForEach(board[6], id: \.self) { element in
                        Text("\(element)")
                    }
                }
                
                
                

            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
