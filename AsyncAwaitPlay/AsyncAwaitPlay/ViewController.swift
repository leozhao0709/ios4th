//
//  ViewController.swift
//  AsyncAwaitPlay
//
//  Created by Lei Zhao on 2/21/22.
//
//

import UIKit


class ViewController: UIViewController {

    let urlSession = URLSession.shared
    private var button: UIButton? = {
        print("----")

        let btn = UIButton(type: .roundedRect)
        btn.setTitle("click me", for: .normal)
        btn.addTarget(self, action: #selector(downloadTask), for: .touchUpInside)
        btn.sizeToFit()
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button?.center = view.center
        view.addSubview(button!)

        print(button)
        print(button)
        print(button)
    }

    @objc private func downloadTask() {
        Task {
            await btnClick()
        }
    }

    func btnClick() async {
        async let d1 = download1()
          async let d2 = download2()
          async let d3 = download3()

        await [d1, d2, d3]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        Task {
            print("---Task start---", Thread.current)
            print("---Task end---", Thread.current)
        }

        print("---touchBegin end---")
    }

    private func download1() async {
        print("---download1---", Thread.current)
    }

    private func download2() async {
        print("---download2---", Thread.current)
    }

    private func download3() async {
        print("---download3---", Thread.current)
    }

    private func getTodos() async throws -> [Todo]? {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            throw NSError(domain: "url error", code: 42)
        }

        let (data, response) = try await urlSession.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error response")
        }
        let todos = try? JSONDecoder().decode([Todo].self, from: data)

        return todos
    }
}
