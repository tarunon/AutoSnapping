//
//  ViewController.swift
//  Sample
//
//  Created by Nobuo Saito on 2015/08/20.
//  Copyright © 2015年 tarunon. All rights reserved.
//

import UIKit
import AutoSnapping

class ViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var autoSnappingEnabled = true

    @IBAction func switchAutoSnappingEnabled(sender: UISwitch) {
        autoSnappingEnabled = sender.on
    }

    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if autoSnappingEnabled {
            targetContentOffset.memory = tableView.autoSnapping(velocity: velocity, targetOffset: targetContentOffset.memory)
        }
    }
}

