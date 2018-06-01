//
//  ViewController.swift
//  101-tableHeader-autolayout
//
//  Created by 于传峰 on 6/1/18.
//  Copyright © 2018 于传峰. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var tableView: UITableView!
    private var headerView: TableHeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "table title"
        setupSubViews()
    }
    
    private func setupSubViews(){
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        headerView = TableHeaderView()
        tableView.tableHeaderView = headerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeSize(_ sender: Any) {
        headerView.change()
        tableView.beginUpdates()
        tableView.tableHeaderView = headerView
        tableView.endUpdates()
    }
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil{
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = "index-\(indexPath.row)"
        return cell!
    }
}
