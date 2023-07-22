//
//  ContentView.swift
//  iExpense
//
//  Created by csuftitan on 11/25/22.
//

import SwiftUI

// Building a list we can delete from

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    List {
                        ForEach(expenses.items, id: \.id) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(item.amount < 10.0 ? .green : item.amount < 100.0 ? .gray : .red)
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                } header: {
                    Text("Personal Expenses")
                }
                Section {
                    List {
                        ForEach(expenses.businessItems, id: \.id) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(item.amount < 10.0 ? .green : item.amount < 100.0 ? .gray : .red)
                            }
                        }
                        .onDelete(perform: removeBusinessItems)
                    }
                } header: {
                    Text("Business Expenses")
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
