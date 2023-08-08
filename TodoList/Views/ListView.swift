//
//  ListView.swift
//  TodoList
//
//  Created by Akbarjon Juramirzaev on 08/08/23.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first title!", isCompleted: false),
        ItemModel(title: "This is the second title!", isCompleted: true),
        ItemModel(title: "This is the third title!", isCompleted: false)
    ]
    
    var body: some View { // start of body
        List { // start of List
            ForEach(items) { item in
                ListRowView(item: item)
            }
        } // end of List
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        } // end of toolbar
    } // end of body
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListView()
        }
    }
}
