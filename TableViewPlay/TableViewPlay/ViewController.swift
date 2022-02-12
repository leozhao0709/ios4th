//
//  ViewController.swift
//  TableViewPlay
//
//  Created by Lei Zhao on 2/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

//    @IBOutlet weak var tableView: UITableView!

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PlayTableViewCell.self, forCellReuseIdentifier: PlayTableViewCell.identifier)
        return tableView
    }()

    private lazy var blogModels: [BlogModel] = {
        // load data
        guard let path = Bundle.main.path(forResource: "weibos.plist", ofType: nil) else {
            return []
        }
        guard let tempArray = NSArray(contentsOfFile: path) else {return []}
        return tempArray.map { dict -> BlogModel in
            BlogModel(dict: dict as! [String: Any])
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.backgroundColor = .link

        view.addSubview(tableView)

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
        print(cell)
        return cell
    }
}

