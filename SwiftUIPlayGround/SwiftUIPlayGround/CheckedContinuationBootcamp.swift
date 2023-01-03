//
//  CheckedContinuationBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/21/22.
//

import SwiftUI

class ImageDownloadManager {
    static let sharedInstance = ImageDownloadManager()
    
    private init() {}
    
    func getImage(url: String) async throws -> Data {
        return try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Data, Error>) in
            
            guard let url = URL(string: url) else {
                continuation.resume(throwing: URLError(.badURL))
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, resp, err in
                if let err = err {
                    continuation.resume(throwing: err)
                } else if let data = data {
                    continuation.resume(returning: data)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }.resume()
        }
    }
}

class CheckedContinuationViewModel: ObservableObject {
    @Published var image: UIImage?
    
    private let manager = ImageDownloadManager.sharedInstance
    
    func fetchImage() async throws {
        let url = "https://picsum.photos/300"
        let data = try await manager.getImage(url: url)
        if let image = UIImage(data: data) {
            await MainActor.run {
                self.image = image
            }
        }
    }
}

struct CheckedContinuationBootcamp: View {
    @StateObject var vm = CheckedContinuationViewModel()

    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            } else {
                ProgressView()
            }
        }
        .task {
            do {
                try await vm.fetchImage()
            } catch {
                print("---error---\(error)")
            }
        }
        
    }
}

struct CheckedContinuationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CheckedContinuationBootcamp()
    }
}
