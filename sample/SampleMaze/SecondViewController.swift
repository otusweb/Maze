//
//  SecondViewController.swift
//  SampleMaze
//
//  Created by Olivier Destrebecq on 9/23/18.
//  Copyright © 2018 MobDesign. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchToThirdViewController(_ sender: Any) {
        let controller = ThirdViewController()
        self.present(controller, animated: true)
    }
    
}

