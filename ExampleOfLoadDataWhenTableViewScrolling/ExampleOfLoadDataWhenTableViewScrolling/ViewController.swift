//
//  ViewController.swift
//  ExampleOfLoadDataWhenTableViewScrolling
//
//  Created by 박성원 on 19/09/2019.
//  Copyright © 2019 sungwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBOutlet weak var tableView: UITableView!
    var hasMore = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .green
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == dataArray.count - 1 && hasMore {
            let moreDataArray = ["11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]
            hasMore = false
            dataArray += moreDataArray
            
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
}

