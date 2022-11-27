//
//  SwiftUIPlayGroundApp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 11/17/22.
//

import SwiftUI

@main
struct SwiftUIPlayGroundApp: App {
    
    @State private var postViewModel = PostsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(postViewModel: postViewModel)
        }
    }
}
