//
//  DownloadImageAsync.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/20/22.
//

import SwiftUI

class DownloadImageAsyncLoader {
    let url = URL(string: "https://picsum.photos/300")
    
    private func handleResponse(data: Data, response: URLResponse) -> UIImage? {
        guard
            let response = response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300,
            let image = UIImage(data: data) else{
                return nil
            }
        return image;
    }
    
    func downloadAsync() async throws -> UIImage? {
        do {
            guard let url = url else {
                return nil
            }
            let (data, response) = try await URLSession.shared.data(from: url)
            return handleResponse(data: data, response: response)
        } catch  {
            throw error
        }
    }
}

class DownloadImageAsyncViewModel: ObservableObject {
    @Published var image: UIImage?
    private var loader = DownloadImageAsyncLoader()
    
    func fetchImage() async {
        let image =  try? await loader.downloadAsync()
        
        // run this in main thread
        await MainActor.run {
            self.image = image
        }
    }
}

struct DownloadImageAsync: View {
    
    @StateObject var vm = DownloadImageAsyncViewModel()
    
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    
            } else {
                ProgressView()
            }
        }
        .task {
            await vm.fetchImage()
        }
    }
}

struct DownloadImageAsync_Previews: PreviewProvider {
    static var previews: some View {
        DownloadImageAsync()
    }
}
