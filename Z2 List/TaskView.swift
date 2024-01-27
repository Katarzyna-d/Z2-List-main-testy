//
//  TaskView.swift
//  Z2 List
//
//  Created by user225913 on 1/29/23.
//

import SwiftUI

struct TaskView: View {
    

    var opis: String
    
    var body: some View {
        Text(opis)
           .navigationTitle("Todo list: ")
        Image("buy")
            .resizable()
            .scaledToFit()
    }
        
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
       TaskView(opis: "opis1")}
}
