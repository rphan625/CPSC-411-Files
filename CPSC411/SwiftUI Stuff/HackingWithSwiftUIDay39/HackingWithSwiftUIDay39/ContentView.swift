//
//  ContentView.swift
//  HackingWithSwiftUIDay39
//
//  Created by csuftitan on 12/1/22.
//

import SwiftUI

struct ContentView : View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120)), // will adapt to how much columns we can have on screen
    ]
     
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

// Working with hierarchiable Codable Data

//struct User: Codable { // Swift representation of the JSON data
//    let name: String
//    let address: String
//}
//
//struct Address: Codable {
//    let street: String
//    let city: String
//}
//
//struct ContentView : View {
//    var body: some View {
//        Button("Decode JSON") {
//            let input = """
//            {
//                "name": "Taylor Swift",
//                "address": {
//                    "street": "555, Taylor Swift Avenue",
//                    "city": "Nashville"
//                }
//            }
//            """
//            let data = Data(input.utf8)
//            let decoder = JSONDecoder()
//            if let user = try? decoder.decode(User.self, from: data) {
//                print(user.address.street) // this worked once, now it doesn't work for some reason
//            }
//        }
//    }
//}

// Pushing new views onto stack, using NavigationLink

//struct ContentView : View {
//    var body: some View {
//        NavigationView {
//            List(0..<100) { row in
//                NavigationLink {
//                    Text("Detail \(row)")
//                } label: {
//                    Text("Row \(row)")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
//    }
//}


// ScrollView

//struct CustomText : View {
//    let text: String
//
//    var body: some View {
//        Text(text)
//    }
//
//    init(_ text: String) {
//        print("Creating a new CustomText")
//        self.text = text
//    }
//}
//
//struct ContentView : View {
//    var body: some View {
//        ScrollView(.horizontal) {
//            LazyHStack(spacing: 10) { // LazyStack takes up all the space, unlike normal Stack, which is within the container provided
//                ForEach(0..<100) {
//                    CustomText("Item \($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }
//}

// Scaling images with GeometryReader

//struct ContentView: View {
//    var body: some View {
//        GeometryReader { geo in
//            Image("backgroundExample")
//                .resizable()
//                .scaledToFit()
//                .frame(width: geo.size.width * 0.8) // adjust the image width itself
//                .frame(width: geo.size.width, height: geo.size.height) // adjust the container that has the initial image
//        }
//    }
//}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
