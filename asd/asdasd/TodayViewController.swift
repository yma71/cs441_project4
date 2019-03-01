//
//  TodayViewController.swift
//  asdasd
//
//  Created by 马演喆 on 2019/3/1.
//  Copyright © 2019年 马演喆. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var num: UILabel!
    private let model = CoreDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nums = model.getNumbers()
        if let last = nums.last {
            num.text = String(last)
        }
        // Do any additional setup after loading the view from its nib.
    }
        
    @IBAction func addNumber() {
        let rand = Int(arc4random_uniform(1000))
        num.text = String(rand)
        model.addNew(number: rand)
    }

    
}
