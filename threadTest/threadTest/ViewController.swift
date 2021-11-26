//
//  ViewController.swift
//  threadTest
//
//  Created by Lei Zhao on 11/25/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        syncSearial()
    }
    
    private func asyncConcurrent() {
        print("start---\(Thread.current)")
        DispatchQueue.global().async {
            print("Download1.....start\(Thread.current)")
            print("Download1.....end\(Thread.current)")
        }
        DispatchQueue.global().async {
            print("Download2.....start\(Thread.current)")
            print("Download2.....end\(Thread.current)")
        }
        DispatchQueue.global().async {
            print("Download3.....start\(Thread.current)")
            print("Download3.....end\(Thread.current)")
        }
        print("end---")
    }
    
    private func asyncSearial() {
        print("start---\(Thread.current)")
        DispatchQueue.main.async {
            print("Download1.....start\(Thread.current)")
            print("Download1.....end\(Thread.current)")
        }
        DispatchQueue.main.async {
            print("Download2.....start\(Thread.current)")
            print("Download2.....end\(Thread.current)")
        }
        DispatchQueue.main.async {
            print("Download3.....start\(Thread.current)")
            print("Download3.....end\(Thread.current)")
        }
        print("end-----")
    }
    
    private func syncConcurrent() {
        print("start---\(Thread.current)")
        DispatchQueue.global().sync {
            print("Download1.....start\(Thread.current)")
            print("Download1.....end\(Thread.current)")
        }
        DispatchQueue.global().sync {
            print("Download2.....start\(Thread.current)")
            print("Download2.....end\(Thread.current)")
        }
        DispatchQueue.global().sync {
            print("Download3.....start\(Thread.current)")
            print("Download3.....end\(Thread.current)")
        }
        print("end-----")
    }
    
    private func syncSearial() {
        print("start---\(Thread.current)")
        let searialQueue = DispatchQueue(label: "queuename")
        searialQueue.sync {
            print("Download1.....start\(Thread.current)")
            print("Download1.....end\(Thread.current)")
        }
        searialQueue.sync {
            print("Download2.....start\(Thread.current)")
            print("Download2.....end\(Thread.current)")
        }
        searialQueue.sync {
            print("Download3.....start\(Thread.current)")
            print("Download3.....end\(Thread.current)")
        }
        print("end-----")

        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            print("1s late to run")
        }
    }
}

