//
//  ViewController.swift
//  MVVM
//
//  Created by Leonir (Pessoal) on 23/01/19.
//  Copyright © 2019 Leonir (Pessoal). All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    private var tableView = UITableView()
    private var myViewModel = MyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(Cell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.dataSource = self
    }
    
    private func loadViewModel() {
        myViewModel.updateList = {
            self.tableView.reloadData()
        }
    }
}

extension MyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myViewModel.numberRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell
        cell.setup(myViewModel.cellVM(index: indexPath.row))
        return cell
    }
}
