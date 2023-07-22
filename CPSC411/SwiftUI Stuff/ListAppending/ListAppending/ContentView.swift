//
//  ContentView.swift
//  ListAppending
//
//  Created by csuftitan on 12/13/22.
//

import SwiftUI

class List: ObservableObject {
    @Published var numsList = [0, 1, 2, 3, 4]
}

struct EditListView: View {
    @StateObject var numList = List()
    var body: some View {
        VStack {
            Form {
                ForEach(numList.numsList, id: \.self) { number in
                    Text("\(number)")
                }
            }
        }
        .environmentObject(numList)
    }
}


struct ContentView: View {
    @EnvironmentObject var numList : List
    
    var body: some View {
        NavigationView {
            Form {
                ForEach(numList.numsList, id: \.self) { number in
                    Text("\(number)")
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                Button("Add") {
                    numList.numsList.append(1)
                }
            }
        }
        .environmentObject(List())
    }
    
    func delete(at offsets: IndexSet) {
        numList.numsList.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(List())
    }
}
