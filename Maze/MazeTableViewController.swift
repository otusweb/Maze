//
//  MazeTableTableViewController.swift
//  Maze
//
//  Created by Olivier Destrebecq on 9/24/18.
//  Copyright © 2018 MobDesign. All rights reserved.
//

import UIKit


let classCellReuseIdentifier = "classCell"



// https://github.com/sushinoya/lumos/blob/945fec6393577f7e7350cbfb9bc04fa443504263/Lumos/Lumos/Sources/RuntimeQueries.swift

@objc public class MazeTableViewController: UITableViewController {
    
    let maze = Maze()

    public override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Your controllers"

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: classCellReuseIdentifier)
        
        let closeButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(close))
        self.navigationItem.setRightBarButton(closeButton, animated: false)
    }

    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func close()
    {
        self.dismiss(animated: true)
    }

    // MARK: - Table view data source

    public override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return maze.mazePaths.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: classCellReuseIdentifier, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = maze.mazePaths[indexPath.row].label

        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ConfigurationsTableViewController(mazePath: maze.mazePaths[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
