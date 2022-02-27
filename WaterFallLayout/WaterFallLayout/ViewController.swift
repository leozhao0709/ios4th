import UIKit


class ViewController: UIViewController {

    private weak var refreshControl: UIRefreshControl?
    private weak var collectionView: UICollectionView?

    var itemCount = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupCollectionView()
        setupRefreshControl()
    }

    private func setupCollectionView() {
        let layout = WaterFallLayout(columnCount: 3, interItemSpacing: 10, lineSpacing: 10)
        layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 100, right: 10)
        layout.delegate = self

        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = .tintColor

        collectionView.register(WaterFallCell.self, forCellWithReuseIdentifier: WaterFallCell.identifier)
        view.addSubview(collectionView)
        self.collectionView = collectionView
    }

    private func setupRefreshControl() {
        let refreshControl = UIRefreshControl()
        self.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }

    @objc private func refresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            itemCount += 10
            refreshControl?.endRefreshing()
            collectionView?.reloadData()
        }
    }
}

extension ViewController: WaterFallLayoutDelegate {
    func heightForItem(at indexPath: IndexPath, itemPosition position: CGPoint, itemWidth width: CGFloat) -> CGFloat {
        100 + CGFloat(indexPath.row % 7) * 10
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WaterFallCell.identifier, for: indexPath) as! WaterFallCell
        cell.mark = String(indexPath.item)
        return cell
    }


}