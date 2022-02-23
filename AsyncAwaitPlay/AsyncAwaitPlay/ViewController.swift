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
    private weak var button: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let btn = UIButton(type: .roundedRect)
        btn.setTitle("click me", for: .normal)
        btn.addTarget(self, action: #selector(downloadTask), for: .touchUpInside)
        btn.sizeToFit()

        btn.center = view.center

        button = btn
        view.addSubview(btn)
    }

    private func test() {
        print(button)
        button?.removeFromSuperview()
        print(button)
    }

    @objc private func downloadTask() {
        test()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print(button)
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
