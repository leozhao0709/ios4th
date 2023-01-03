//
//  TaskGroupBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/20/22.
//

import SwiftUI

actor TaskGroupDataManager {
    static let sharedInstance = TaskGroupDataManager()
    
    private init() {}
    
    func fetchImages() async throws -> [UIImage] {
        let urlStrings = [
            "https://picsum.photos/300",
            "https://picsum.photos/300",
            "https://picsum.photos/300",
            "https://picsum.photos/300",
        ]
        
        let images: [UIImage] = try await withThrowingTaskGroup(of: UIImage.self) { [weak self] group in
            
            guard let self = self else {
                return []
            }
            var images: [UIImage] = []
            for urlString in urlStrings {
                group.addTask {
                   try await self.fetchImage(url: urlString)
                }
            }
            
            for try await image in group {
                images.append(image)
            }
            
            return images
        }
        
        return images
    }
    
    private func fetchImage(url: String) async throws -> UIImage {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else {
                throw URLError(.badURL)
            }
            return image
        } catch {
            throw error
        }
    }
}

class TaskGroupViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    let dataManager = TaskGroupDataManager.sharedInstance
    
    func getImage() async {
        guard let images = try? await dataManager.fetchImages() else {
            return;
        }
        await MainActor.run {
            self.images = images
        }
    }
}


struct TaskGroupBootcamp: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var vm = TaskGroupViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
                .task {
                    await vm.getImage()
                }
            }
            .navigationTitle("Task Group")
        }
    }
}

struct TaskGroupBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroupBootcamp()
    }
}
