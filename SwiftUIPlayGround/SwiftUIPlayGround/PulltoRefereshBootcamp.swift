//
//  PulltoRefereshBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/25/22.
//

import SwiftUI

struct PulltoRefereshBootcamp: View {
    
    let fruits: [String] = ["Apple", "banana", "abb", "orange"]
    @State var searchText = ""
    var searchedFruits: [String] {
        if searchText.isEmpty {
            return fruits
        }
        return fruits.filter { $0.lowercased().starts(with: searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchedFruits, id: \.self) {
                    Text($0)
                }
            }
            .refreshable {
                print("Do your refresh work here")
            }
            .searchable(text: $searchText)
        }
    }
}

struct PulltoRefereshBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PulltoRefereshBootcamp()
    }
}
