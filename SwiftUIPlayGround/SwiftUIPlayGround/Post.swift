//
//  Post.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 11/17/22.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
