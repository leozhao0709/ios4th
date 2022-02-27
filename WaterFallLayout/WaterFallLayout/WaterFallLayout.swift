//
// Created by Lei Zhao on 2/26/22.
//

import UIKit

protocol WaterFallLayoutDelegate {
    func heightForItem(at indexPath: IndexPath, itemPosition position: CGPoint, itemWidth width: CGFloat) -> CGFloat
}

class WaterFallLayout: UICollectionViewFlowLayout {
    // our waterFallLayout item has same width, but different height
    // default value if outsider not defined
    var columnCount = 3
    var interItemSpacing: CGFloat = 20
    var lineSpacing: CGFloat = 20


    var delegate: WaterFallLayoutDelegate?

    private var columnHeightArr: [CGFloat] = []
    private var attrArr: [UICollectionViewLayoutAttributes]? = []

    override init() {
        super.init()
    }

    init(columnCount: Int, interItemSpacing: CGFloat, lineSpacing: CGFloat) {
        super.init()
        self.columnCount = columnCount
        self.interItemSpacing = interItemSpacing
        self.lineSpacing = lineSpacing
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func prepare() {
        super.prepare()
        // clean up any existing array
        columnHeightArr = Array(repeating: 0, count: columnCount)
        attrArr = []

        // only 1 section
        let itemsCount = collectionView!.numberOfItems(inSection: 0)

        for i in 0..<itemsCount {
            let indexPath = IndexPath(item: i, section: 0)
            attrArr!.append(layoutAttributesForItem(at: indexPath)!)
        }

    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        attrArr
    }


    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = super.layoutAttributesForItem(at: indexPath)?.copy() as! UICollectionViewLayoutAttributes

        let minColumnHeight = columnHeightArr.min()!
        let minColumnHeightIndex = columnHeightArr.firstIndex(of: minColumnHeight)!

        let width = (collectionView!.bounds.width - sectionInset.left - sectionInset.right - CGFloat(columnCount - 1) * interItemSpacing) / CGFloat(columnCount);
        let x: CGFloat = CGFloat(minColumnHeightIndex) * (interItemSpacing + width) + sectionInset.left;
        var y: CGFloat = minColumnHeight + lineSpacing;
        if minColumnHeight == 0 {
            // first row, need section top but without line spacing
            y += sectionInset.top - lineSpacing
        }

        var height = 100 + CGFloat(indexPath.row % 10) * 10
        if let delegate = delegate {
            height = delegate.heightForItem(at: indexPath, itemPosition: CGPoint(x: x, y: y), itemWidth: width)
        }

        attributes.frame = CGRect(x: x, y: y, width: width, height: height)

        columnHeightArr[minColumnHeightIndex] = attributes.frame.maxY

        return attributes
    }

    override var collectionViewContentSize: CGSize {
        CGSize(width: collectionView!.bounds.width, height: columnHeightArr.max()! + sectionInset.bottom)
    }
}
