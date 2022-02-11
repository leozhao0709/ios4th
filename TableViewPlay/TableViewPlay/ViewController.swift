//
//  ViewController.swift
//  TableViewPlay
//
//  Created by Lei Zhao on 2/11/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    static let cellIdentifier = "PlayTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.register(PlayTableViewCell.self, forCellReuseIdentifier: Self.cellIdentifier)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier) ?? PlayTableViewCell(style: .default, reuseIdentifier: Self.cellIdentifier)
        return cell
    }
}

