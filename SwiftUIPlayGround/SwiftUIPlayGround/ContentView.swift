//
//  ContentView.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 11/17/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var postViewModel: PostsViewModel

    var body: some View {
        VStack {
            if let post = postViewModel.post {
                Form{
                    Section(header: Text("id")) {
                        Text(String(post.id))
                    }
                    Section(header: Text("title")) {
                        Text(post.title)
                    }
                    Section(header: Text("body")) {
                        Text(post.body)
                    }
                    Section(header: Text("userId")) {
                        Text(String(post.userId))
                    }
                }
            }
            Button("fetch Post") {
                postViewModel.fetchPost(id: 10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView(postViewModel: PostsViewModel())
    }
}
