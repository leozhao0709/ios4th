//
//  PlayTableViewCell.swift
//  TableViewPlay
//
//  Created by Lei Zhao on 2/11/22.
//

import UIKit
import SnapKit

class PlayTableViewCell: UITableViewCell {

    static let identifier = "PlayTableViewCell"

    private var headerView: UIImageView!
    private var nameLabel: UILabel!
    private var vipView: UIImageView!
    private var textView: UILabel!
    private var pictureView: UIImageView!

    var blogModel: BlogModel? {
        didSet {
            headerView.image = UIImage(named: blogModel!.icon)
            nameLabel.text = blogModel?.name
            vipView.isHidden = blogModel!.vip == 1
            textView.text = blogModel?.text
            if let picture = blogModel?.picture {
                pictureView.isHidden = false;
                pictureView.image = UIImage(named: picture)
            } else {
                pictureView.isHidden = true;
                pictureView.snp.updateConstraints { make in
                    make.height.equalTo(0)
                }
            }
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        setupUI()
        updateConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        headerView = UIImageView(image: nil)
        nameLabel = UILabel()
        textView = UILabel()
        textView.numberOfLines = 0
        vipView = UIImageView(image: UIImage(named: "vip"))
        pictureView = UIImageView(image: nil)


        contentView.addSubview(headerView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(textView)
        contentView.addSubview(vipView)
        contentView.addSubview(pictureView)

    }

    override func updateConstraints() {
        configAutoLayout()
        print("...updateConstraints...")
        super.updateConstraints()
    }

    private func configAutoLayout() {
        headerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }

        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(headerView.snp.right).offset(10)
            make.top.equalTo(headerView)
            make.centerY.equalTo(headerView.snp.centerY)
        }

        vipView.snp.makeConstraints { make in
            make.left.equalTo(nameLabel.snp.right).offset(20)
            make.centerY.equalTo(headerView.snp.centerY)
            make.width.equalTo(14)
            make.height.equalTo(14)
        }

        textView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.left.equalTo(headerView)
            make.right.equalToSuperview().offset(-20)
        }

        pictureView.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom).offset(10)
            make.left.equalTo(headerView)
            make.height.equalTo(50)
            make.width.equalTo(100)

            // The core for cell autolayout is to give last element a bottom offset
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
