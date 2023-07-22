//
//  ContentView.swift
//  HackingWithSwiftUIDay23
//
//  Created by csuftitan on 11/15/22.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .background(.blue)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct WaterMark: ViewModifier {
    var text:String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black )
        }
    }
}

struct BlueTitle:ViewModifier {
    
    var text: String
    func body(content: Content) -> some View {
        
        VStack {
            Text(text)
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding(5)
                .background(.black)
            
            content
        }
    }
}


extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

extension View {
    func waterMarked(with text:String) -> some View {
        modifier(WaterMark(text: text))
    }
}

extension View {
    func blueTitle(with text:String) -> some View {
        modifier(BlueTitle(text: text))
    }
}

struct GridStack<Content:View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content // Makes views into tuples, allowing more than one view
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}


struct CapsuleView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            GridStack(rows: 4, columns: 4) { row, col in
                Image(systemName: "\(row*4 + col).circle")
                Text("R\(row) C\(col) ")
            }
            .blueTitle(with: "GridStack")
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        VStack(spacing:10) {
//            Text("Hello World")
//                .modifier(Title())
//            Text("Second World")
//                .titleStyle()
//            CapsuleView(text: "First")
//                .foregroundColor(.white)
//            CapsuleView(text: "Second")
//                .foregroundColor(.yellow)
//
//            Color.blue
//                .frame(width: 300, height: 200)
//                .waterMarked(with: "Hacking With SwiftUI")
//
//        }
//    }
//}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
