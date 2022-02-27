//
// Created by Lei Zhao on 2/26/22.
//

import UIKit

class WaterFallLayout: UICollectionViewFlowLayout {
    // our waterFallLayout item has same width, but different height
    var columnCount = 3
    var interItemSpacing: CGFloat = 20
    var lineSpacing: CGFloat = 20

    private var columnHeightArr: [CGFloat] = []
    private var attrArr: [UICollectionViewLayoutAttributes]? = []

    override func prepare() {
        super.prepare()
        // clean up any existing array
        columnHeightArr = Array(repeating: 0, count: columnCount)
        attrArr = []

        // only 1 section
        let itemsCount = collectionView!.numberOfItems(inSection: 0)

        for i in 0 ..< itemsCount {
            let indexPath = IndexPath(item: i, section: 0)
            attrArr!.append(layoutAttributesForItem(at: indexPath)!)
        }

    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let attrs = super.layoutAttributesForElements(in: rect)
//        guard let attrs = attrs else { return nil }
//
//        return attrs.map { attributes in
//            let indexPath = attributes.indexPath
//            return layoutAttributesForItem(at: indexPath)!
//        }

        attrArr
    }

    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.layoutAttributesForItem(at: indexPath)

        let minColumnHeight = columnHeightArr.min()!
        let minColumnHeightIndex = columnHeightArr.firstIndex(of: minColumnHeight)!

        let width = (collectionView!.bounds.width - CGFloat(columnCount - 1) * interItemSpacing) / CGFloat(columnCount);
        let height = 100 + CGFloat.random(in: 0..<100)
        let x: CGFloat = CGFloat(minColumnHeightIndex) * (interItemSpacing + width);
        let y: CGFloat = minColumnHeight + lineSpacing;

        attributes?.frame = CGRect(x: x, y: y, width: width, height: height)

        columnHeightArr[minColumnHeightIndex] = attributes!.frame.maxY

        return attributes
    }

    override var collectionViewContentSize: CGSize {
        CGSize(width: collectionView!.bounds.width, height: columnHeightArr.max()!)
    }
}
