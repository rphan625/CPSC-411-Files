//
//  ContentView.swift
//  tictactoe
//
//  Created by csuftitan on 11/9/22.
//

import SwiftUI

struct ContentView: View {
    @State var gamerunning = true
    @State var currentplayer:Int = 1 // player 1
    @State var buttonTitle:String = "0"
    @State var grid = ["0","1","2","3","4","5","6","7","8"]
    @State var winnernum:Int = 0
    @State var winnerline:Int = 0
    
    func checkforwin() {
        if (grid[0] == grid[1] && grid[1] == grid[2]) {     //row1
            winnerline = 1
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 1")
        }
        else if (grid[3] == grid[4] && grid[4] == grid[5]) {//row2
            winnerline = 2
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 2")
        }
        else if (grid[6] == grid[7] && grid[7] == grid[8]) {//row3
            winnerline = 3
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 3")
        }
        else if (grid[0] == grid[4] && grid[4] == grid[8]) {//leftrightdiagonal
            winnerline = 4
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 4")
        }
        else if (grid[2] == grid[4] && grid[4] == grid[6]) {//rightleftdiagonal
            winnerline = 5
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 5")
        }
        else if (grid[0] == grid[3] && grid[3] == grid[6]) {//col1
            winnerline = 6
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 6")
        }
        else if (grid[1] == grid[4] && grid[4] == grid[7]) {//col2
            winnerline = 7
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 7")
        }
        else if (grid[2] == grid[5] && grid[5] == grid[8]) {//col3
            winnerline = 8
            winnernum = currentplayer
            gamerunning.toggle()
            print("win 8")
        }
        else if (!grid.contains("0") && !grid.contains("1") && !grid.contains("2") && !grid.contains("3") && !grid.contains("4") && !grid.contains("5") && !grid.contains("6") && !grid.contains("7") && !grid.contains("8")) {
            gamerunning.toggle()
            winnernum = 0
        }
    }
    
    var body: some View {
        if (gamerunning) {
            VStack {
                if (gamerunning) {
                    if (currentplayer == 1) {
                        Text("Current Player: 1")
                    }
                    else {
                        Text("Current Player: 2")
                    }
                }
                else {
                    if (currentplayer == 1) {
                        Text("Winner is Player 2")
                    }
                    else {
                        Text("Winner is Player 1")
                    }
                }
                HStack {
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[0] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[0] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[0])")
                    }
                    Text("|")
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[1] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[1] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[1])")
                    }
                    Text("|")
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[2] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[2] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[2])")
                    }
                }
                Text("-----------")
                HStack {
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[3] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[3] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[3])")
                    }
                    Text("|")
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[4] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[4] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[4])")
                    }
                    Text("|")
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[5] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[5] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[5])")
                    }
                }
                Text("-----------")
                HStack {
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[6] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[6] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[6])")
                    }
                    Text("|")
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[7] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[7] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[7])")
                    }
                    Text("|")
                    Button(action: {
                        if (currentplayer == 1) {
                            grid[8] = "X"
                            checkforwin()
                            currentplayer = 2
                            print("space pressed")
                        }
                        else {
                            grid[8] = "O"
                            checkforwin()
                            currentplayer = 1
                            print("space pressed")
                        }
                    }) {
                        Text("\(grid[8])")
                    }
                }
            }
            .padding()
        }
        else {
            ZStack {
                VStack {
                    Text("Game Over!!")
                    if (winnernum == 0) {
                        Text("No Winner!")
                    }
                    else {
                        Text("Player \(winnernum) Won!")
                    }
                    Text("\(grid[0]) | \(grid[1]) | \(grid[2])")
                    Text("-----------")
                    Text("\(grid[3]) | \(grid[4]) | \(grid[5])")
                    Text("-----------")
                    Text("\(grid[6]) | \(grid[7]) | \(grid[8])")
                }
                switch winnerline {
                case 1:
                    Path() { path in
                        path.move(to: CGPoint(x: 165, y: 360))
                        path.addLine(to: CGPoint(x: 227, y: 360))
                    }
                    .stroke(Color.red, lineWidth: 5)
                case 2:
                    Path() { path in
                        path.move(to: CGPoint(x: 165, y: 400))
                        path.addLine(to: CGPoint(x: 227, y: 400))
                    }
                    .stroke(Color.red, lineWidth: 5)
                case 3:
                    Path() { path in
                        path.move(to: CGPoint(x: 165, y: 440))
                        path.addLine(to: CGPoint(x: 227, y: 440))
                    }
                    .stroke(Color.red, lineWidth: 5)
                case 4:
                    Path() { path in
                        path.move(to: CGPoint(x: 169, y: 350))
                        path.addLine(to: CGPoint(x: 227, y: 450))
                    }
                    .stroke(Color.red, lineWidth: 5)
                case 5:
                    Path() { path in
                        path.move(to: CGPoint(x: 169, y: 450))
                        path.addLine(to: CGPoint(x: 227, y: 350))
                    }
                    .stroke(Color.red, lineWidth: 5)
                case 6:
                    Path() { path in
                        path.move(to: CGPoint(x: 173, y: 350))
                        path.addLine(to: CGPoint(x: 173, y: 450))
                    }
                    .stroke(Color.red, lineWidth: 5)
                case 7:
                    Path() { path in
                        path.move(to: CGPoint(x: 197, y: 350))
                        path.addLine(to: CGPoint(x: 197, y: 450))
                    }
                    .stroke(Color.red, lineWidth: 5)
                case 8:
                    Path() { path in
                        path.move(to: CGPoint(x: 221, y: 350))
                        path.addLine(to: CGPoint(x: 221, y: 450))
                    }
                    .stroke(Color.red, lineWidth: 5)

                default:
                    Text("Game broke")
                }
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
