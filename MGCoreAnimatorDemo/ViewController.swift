//
//  ViewController.swift
//  MGCoreAnimatorDemo
//
//  Created by Tuan Truong on 8/27/16.
//  Copyright © 2016 Tuan Truong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var trashBin: TrashBinView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func open(sender: AnyObject) {
        trashBin.addOpenAnimation()
    }

    @IBAction func close(sender: AnyObject) {
        trashBin.addCloseAnimation()
    }

}

