//
//  ViewController.swift
//  RunTimeAndCache
//
//  Created by Lei Zhao on 2/20/22.
//
//

import UIKit


class ViewController: UIViewController, NSCacheDelegate {

    private lazy var cache: NSCache<NSString, NSString>? = {
        let _cache = NSCache<NSString, NSString>()
//        _cache.countLimit = 5
        return _cache
    }()

    private var _imageView: UIImageView?
    private weak var imageView: UIImageView? {
        if _imageView == nil {
            _imageView = UIImageView()
        }
        return _imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        cache?.removeAllObjects()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cache?.delegate = self

        for i in 0..<10 {
            print("----add value--- \(i)")
            let key = "h\(i)" as NSString
            cache?.setObject("hello \(i)" as NSString, forKey: key)
        }

        for i in 0..<10 {
            let key = "h\(i)" as NSString
            print("---get value--- \(cache?.object(forKey: key))")
        }

        imageView?.setImageUrl(url: "firstUrl")
        imageView?.setImageUrl(url: "firstUrl")
        imageView?.setImageUrl(url: "secondUrl")
    }

    func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
        print("----will evict object----", obj)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

//        cache?.removeAllObjects()

        for i in 0..<10 {
            print("----add value--- \(i)")
            let key = "h\(i)" as NSString
            cache?.setObject("hello \(i)" as NSString, forKey: key)
        }

        for i in 0..<10 {
            let key = "h\(i)" as NSString
            print("---get value--- \(cache?.object(forKey: key))")
        }
    }
}
