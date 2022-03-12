//
//  ViewController.swift
//  CoreDataPlay
//
//  Created by Lei Zhao on 3/11/22.
//
//

import UIKit


class ViewController: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var persons: [Person]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchPerson()
    }

    private func fetchPerson() {
        let request = Person.fetchRequest()

        let pred = NSPredicate(format: "name contains %@", "test")
        let sort = NSSortDescriptor(keyPath: \Person.name, ascending: true)

        request.predicate = pred
        request.sortDescriptors = [sort]

        let persons = try? context.fetch(request)
        print(persons?.map {
            $0.name
        })
    }

    private func createPerson() {
        let person = Person(context: context)
        person.name = "app1"
        person.age = 25
        person.gender = "male"
        try? context.save()
    }

    private func deletePerson() {
        let personToDelete = persons!.first!
        context.delete(personToDelete)

        try? context.save()
    }

    private func updatePerson() {
        let personToUpdate = persons!.first
        personToUpdate?.name = "test1"
        try? context.save()
    }

    private func fetchPersons() {
        persons = try? context.fetch(Person.fetchRequest())
        print(persons?.map {
            $0.name
        })
    }
}
