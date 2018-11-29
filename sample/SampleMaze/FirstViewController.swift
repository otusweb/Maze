//
//  FirstViewController.swift
//  SampleMaze
//
//  Created by Olivier Destrebecq on 9/23/18.
//  Copyright © 2018 MobDesign. All rights reserved.
//

import UIKit
import Maze

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openMaze(_ sender: Any) {
        let controller = MazeTableViewController()
        let navigationController = UINavigationController(rootViewController: controller)
        
        self.present(navigationController, animated: true)
    }
    
}

