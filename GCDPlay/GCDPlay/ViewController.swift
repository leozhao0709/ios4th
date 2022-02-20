//
//  ViewController.swift
//  GCDPlay
//
//  Created by Lei Zhao on 2/18/22.
//
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        testOperationQueue()
    }

    private func testOperationQueue() {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3

        let op1 = BlockOperation {
            print("----op1----\(Thread.current)")
        }

        op1.completionBlock = {
            print("----op1 complete call---\(Thread.current)")
        }

        op1.qualityOfService = .background

        queue.addOperation(op1)

        queue.addOperation {
            print("---download1-----\(Thread.current)")
        }

        queue.addOperation {
            print("---download2-----\(Thread.current)")
        }

        queue.addBarrierBlock { print("......") }

        queue.addOperation {
            print("---download3-----\(Thread.current)")
            OperationQueue.main.addOperation {
                print("...update UI....\(Thread.current)")
            }
        }
    }

    private func asyncSerial() {
        let serialQueue = DispatchQueue(label: "queuename")
        print("start-------")
        for i in 1..<10 {
            serialQueue.async {
                print("Download\(i).....\(Thread.current)")
            }
        }
        print("end-----")
    }

    private func barrier() {
        print("start-------")
        let queue = DispatchQueue(label: "concurrentQ", attributes: .concurrent)
        queue.async {
            for i in 0..<100 {
                print("\(i)---1----\(Thread.current)")
            }
        }
        queue.async {
            for i in 0..<100 {
                print("\(i)---2----\(Thread.current)")
            }
        }
        queue.async(flags: .barrier) {
            print("+++++++++++++++++++++")
        }
        queue.async {
            for i in 0..<100 {
                print("\(i)---3----\(Thread.current)")
            }
        }
        queue.async {
            for i in 0..<100 {
                print("\(i)---4----\(Thread.current)")
            }
        }
        print("end--------")
    }
}
