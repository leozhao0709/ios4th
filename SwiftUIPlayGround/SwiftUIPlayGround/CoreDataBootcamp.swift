//
//  CoreDataBootcamp.swift
//  SwiftUIPlayGround
//
//  Created by Lei Zhao on 12/20/22.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    @Published var fruits: [FruitEntity] = []

    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { [weak self] description, error in
            if let error = error {
                print("ERROR LOAD CORE DATA. \(error)")
                return
            }
            self?.fetchFruits()
        }
    }
    
    func fetchFruits() {
        // if autocomplete not work, reload xcode
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            fruits = try container.viewContext.fetch(request)
        } catch let error {
            print("Error---fetch error \(error)")
        }
    }
    
    func addFruit(name: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = name
        saveData()
    }
    
    func deleteFruits(indexSet: IndexSet) {
        guard let index = indexSet.first else {
            return
        }
        let entity = fruits[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch(let error) {
            print("Error---Save error \(error)")
        }
    }
}

struct CoreDataBootcamp: View {
    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruit here...", text: $textFieldText)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    guard !textFieldText.isEmpty else {
                        return
                    }
                    vm.addFruit(name: textFieldText)
                    textFieldText = ""
                } label: {
                    Text("Add Fruit")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                List {
                    ForEach(vm.fruits) { fruit in
                        Text(fruit.name ?? "No Name")
                    }
                    .onDelete(perform: vm.deleteFruits)
                }
                .listStyle(PlainListStyle())

                Spacer()
            }
            .navigationTitle("CoreData Bootcamp")
        }
    }
}

struct CoreDataBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataBootcamp()
    }
}
