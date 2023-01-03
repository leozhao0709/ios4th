//
//  AsyncImageBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/17/22.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    let url = URL(string: "http://placeimg.com/640/480/any")
    
    var body: some View {
//        AsyncImage(url: url) { image in
//            image
//                .resizable()
//                .frame(width: 200, height: 200)
//                .scaledToFit()
//                .cornerRadius(20)
//        } placeholder: {
//            ProgressView()
//        }
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                    .cornerRadius(20)
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }

    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}
