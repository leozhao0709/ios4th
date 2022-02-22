//
//  ViewController.swift
//  TableViewPlay
//
//  Created by Lei Zhao on 2/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    @IBOutlet weak var tableView: UITableView!

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlayTableViewCell.self, forCellReuseIdentifier: PlayTableViewCell.identifier)
        return tableView
    }()

    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        refreshControl.tintColor = .red
        refreshControl.attributedTitle = NSAttributedString("拼命加载中。。。")
        return refreshControl
    }()

    @objc private func refreshTable() {
        print("....start refresh....")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("....end refresh....")
            self.refreshControl.endRefreshing()
        }
    }

    private lazy var blogModels: [BlogModel] = {
        // load data
        guard let path = Bundle.main.path(forResource: "weibos.plist", ofType: nil) else {
            return []
        }
        guard let tempArray = NSArray(contentsOfFile: path) else {
            return []
        }
        return tempArray.map { dict -> BlogModel in
            BlogModel(dict: dict as! [String: Any])
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.backgroundColor = .link

        view.addSubview(tableView)

        tableView.addSubview(refreshControl)

//        // automatically calculate row height. Best work with auto layout
//        tableView.rowHeight = UITableView.automaticDimension;
//        // set estimatedRowHeight to whatever is the fallBack rowHeight
//        tableView.estimatedRowHeight = 44;

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        blogModels.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PlayTableViewCell = tableView.dequeueReusableCell(withIdentifier: PlayTableViewCell.identifier, for: indexPath) as! PlayTableViewCell
        cell.blogModel = blogModels[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }

    // 左滑多个按钮设置 (delegate)
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let action1 = UITableViewRowAction(style: .default, title: "action1") { action, path in
            print("...action1...", action, path)
        }

        action1.backgroundColor = .systemOrange

        let action2 = UITableViewRowAction(style: .normal, title: "action2") { action, path in
            print("...action2...", action, path)
        }

        action2.backgroundColor = .systemRed

        return [action1, action2]
    }
}

