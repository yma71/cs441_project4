//
//  ViewController.swift
//  asd
//
//  Created by 马演喆 on 2019/2/28.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var nums = [Int]()
    private let model = CoreDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nums = model.getNumbers()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(nums[indexPath.row])
        return cell
    }
    
    @IBAction func addNum(_ sender: UIBarButtonItem) {
        let rand = Int(arc4random_uniform(1000))
        nums.append(rand)
        model.addNew(number: rand)
        tableView.reloadData()
    }
    


}

