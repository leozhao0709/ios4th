//
//  ViewController.swift
//  WaterFallLayout
//
//  Created by Lei Zhao on 2/25/22.
//
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
//        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }


}

extension ViewController: UICollectionViewDelegate {
    
}