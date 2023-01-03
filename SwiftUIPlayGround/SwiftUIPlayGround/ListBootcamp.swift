//
//  ListBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/17/22.
//

import SwiftUI

struct ListBootcamp: View {
    @State var friutes = ["Apple", "Orange", "Banana", "Peach"]
    
    var body: some View {
        List {
            ForEach(friutes, id: \.self) {
                Text($0)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.yellow)
                        Button("Save") {
                            
                        }
                        .tint(.green)
                        Button("Junk") {
                            
                        }.tint(.black)
                    }
            }
//            .onDelete(perform: delete)
        }
    }
    
    func delete(indexSet: IndexSet) {
        friutes.remove(atOffsets: indexSet)
    }
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ListBootcamp()
    }
}
