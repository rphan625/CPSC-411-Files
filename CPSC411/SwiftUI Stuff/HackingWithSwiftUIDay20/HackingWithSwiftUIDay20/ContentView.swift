//
//  ContentView.swift
//  HackingWithSwiftUIDay20
//
//  Created by csuftitan on 11/12/22.
//

import SwiftUI

// Using stacks to arrange views

//struct ContentView: View {
//    var body: some View {
        //        VStack {
        //            HStack {
        //                Text("1")
        //                Text("2")
        //                Text("3")
        //            }
        //            HStack {
        //                Text("4")
        //                Text("5")
        //                Text("6")
        //            }
        //            HStack {
        //                Text("7")
        //                Text("8")
        //                Text("9")
        //            }
        //        }
//    }
//}

// Colors and frames

//struct ContentView: View {
//    var body: some View {
//        ZStack {
//            Color.red // depends if use is in dark or light mode
//                .frame(width: 200, height: 200)
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
//            Text("Your Content")
//        }
//        .ignoresSafeArea()
//    }
//}

// Colors and frames

//struct ContentView: View {
//    var body: some View {
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Your Content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
//        .ignoresSafeArea()
//    }
//}

// Gradients

//struct ContentView: View {
//    var body: some View {
////        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
////        LinearGradient(gradient: Gradient(stops: [
////            .init(color: .white, location: 0.45),
////            .init(color: .black, location: 0.55)
////        ]),startPoint: .top, endPoint: .bottom)
////        RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//        AngularGradient(gradient: Gradient(colors:[.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//    }
//}

// Buttons and images

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//
//            Button {
//                print("Edit button was tapped!")
//            } label: {
////                Image(systemName: "pencil")
//                Label("Edit", systemImage: "pencil")
//            }
////            .renderingmode(.original) // works for images
//        }
//    }
//
//    func executeDelete() {
//        print("Now deleting")
//    }
//}

// Showing alert messages

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Important message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { } //Dismiss the alert message
        } message: {
            Text("Please read this")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
