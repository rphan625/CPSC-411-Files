//
//  ContentView.swift
//  Chapter5SwiftUIForDummies
//
//  Created by csuftitan on 11/30/22.
//

import SwiftUI

struct country: Identifiable { // you can add :Hashable after country, if you use \.self for id
    let id = UUID()
    let name: String
    let flag: String
}

struct ContentView: View {
    @State private var countries = [
        country(name: "Australia", flag: "australia"),
        country(name: "Belgium", flag: "belgium"),
        country(name: "Canada", flag: "canada"),
        country(name: "Denmark", flag: "denmark"),
        country(name: "Finland", flag: "finland"),
        country(name: "Germany", flag: "germany"),
        country(name: "Japan", flag: "japan"),
        country(name: "United States of America", flag: "united states of america")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(countries) { country in // we can use \.name since names are unique
                    NavigationLink(destination:
                        VStack {
                            Image(country.flag).bold()
                            Text(country.name)
                        }
                    ) {
                        HStack {
                            Image(country.flag)
                            Text(country.name)
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationBarTitle("List of Countries")
            .toolbar {
                Button("Add") {
                    addCountry()
                }
                
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        countries.remove(atOffsets: offsets)
    }
    
    func addCountry() {
        countries.append(country(name: "Norway", flag: "norway"))
    }
    
}

//struct ContentView : View {
//    var body: some View {
//        List {
//            ForEach(0...10, id: \.self) { num in
//                Text("\(num)")
//            }
//        }
//    }
//}

//struct ContentView: View {
//    @State private var countries = [
//        "Australia", "Belgium", "Canada", "Denmark",
//        "Finland", "Germany", "Japan",
//        "United States of America"]
//    var body: some View {
//        List {
//            ForEach(countries, id: \.self) { country in
//                HStack {
//                    Image(country.lowercased())
//                    Text(country)
//                }
//            }
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        List {
//            HStack {
//                Image("australia")
//                Text("Australia")
//                Spacer()
//            }
//            .background(Color(.lightGray))
//            HStack {
//                Image("belgium")
//                Text("Belgium")
//            }
//            HStack {
//                Image("canada")
//                Text("Canada")
//            }
//            HStack {
//                Image("denmark")
//                Text("Denmark")
//            }
//            HStack {
//                Image("finland")
//                Text("Finland")
//            }
//            HStack {
//                Image("germany")
//                Text("Germany")
//            }
//            HStack {
//                Image("japan")
//                Text("Japan")
//            }
//            HStack {
//                Image("united_states")
//                Text("United States of America")
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
