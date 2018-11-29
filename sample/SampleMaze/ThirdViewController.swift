//
//  ThirdViewController.swift
//  SampleMaze
//
//  Created by Olivier Destrebecq on 9/23/18.
//  Copyright © 2018 MobDesign. All rights reserved.
//

import Maze
import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white

        let button = UIButton(type: UIButtonType.system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Close code created controller", for: UIControlState.normal)
        view.addSubview(button)
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.addTarget(self, action: #selector(self.closeController), for: UIControlEvents.touchUpInside)
        button.setNeedsLayout()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @objc func closeController() {
        self.dismiss(animated: true)
    }

    @objc func text() {
        print("text")
    }
}

extension ThirdViewController: MazeProtocol
{
    static func configurations()-> [String] {
        return ["test"]
    }
    
    func test()
    {
        print("test")
    }
}
