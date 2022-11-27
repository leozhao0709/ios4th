//
//  PostsViewModel.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 11/17/22.
//

import Foundation
import Combine

class PostsViewModel: ObservableObject {
    
    @Published var post: Post?
    private var postCancellable: AnyCancellable?
    
    func fetchPost(id: Int) {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)")
        guard let url = url else { return }
        let publisher = session.dataTaskPublisher(for: url)
            .map{ data, response in
                return try? JSONDecoder().decode(Post.self, from: data)
            }
//            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)

        // we need to hold cancellable, otherwise, it will be remove by garbage collector
        self.postCancellable = publisher.sink { result in
            switch result {
            case .finished:
                print("--success---")
            case .failure(let error):
                print("----error---\(error)")
            }
        } receiveValue: { data in
            self.post = data
        }
    }
}
