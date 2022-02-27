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

        setupCollectionView()
    }

    private func setupCollectionView() {
        let layout = WaterFallLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self

        collectionView.register(WaterFallCell.self, forCellWithReuseIdentifier: WaterFallCell.identifier)
        view.addSubview(collectionView)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaterFallCell.identifier, for: indexPath) as! WaterFallCell
        cell.mark = String(indexPath.item)
        return cell
    }


}