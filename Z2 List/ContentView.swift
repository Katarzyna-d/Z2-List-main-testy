//
//  ContentView.swift
//  Z2 List
//
//  Created by user225913 on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    
    mutating func deleteItem(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    struct Task : Identifiable {
        let id = UUID()
        let title: String
        let description: String
    }
    var tasks = [
        Task(title: "task 1",description: "buy potatoes for fries  \n (swiping right will delete task)"),
        Task(title: "task 2",description: "buy potatoes for mashed potatoes"),
        Task(title: "task 3",description: "buy potatoes for roasting"),
        Task(title: "task 4",description: "buy potatoes for potato pancakes")
    ]
    

   
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) {task in
                    HStack {
                        NavigationLink(task.title, destination:
                                        TaskView(opis: task.description))
                    }.padding()
                        .swipeActions(edge:.leading){
                            Button(role: .destructive) {
                                }
                        label: {
                            Label("Delete", systemImage: "trash.fill")
                            }
                        }
                }
//                .onDelete(perform: deleteItem)
            }  .navigationTitle("Todo list: ")
              
                }
        }
        
//    mutating func deleteItem(indexSet: IndexSet) {
//            tasks.remove(atOffsets: indexSet)
        
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
    
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
