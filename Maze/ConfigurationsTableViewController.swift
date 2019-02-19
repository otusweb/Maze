//
//  ConfigurationsTableViewController.swift
//  Maze
//
//  Created by Olivier Destrebecq on 9/24/18.
//  Copyright © 2018 MobDesign. All rights reserved.
//

import UIKit


let configurationCellReuseIdentifier = "configurationCell"

class ConfigurationsTableViewController: UITableViewController {
    let mazePath: MazePath
    
    public init(mazePath: MazePath) {
        self.mazePath = mazePath
        
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: configurationCellReuseIdentifier)
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mazePath.configurations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: configurationCellReuseIdentifier, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = mazePath.configurations[indexPath.row].label
        
        return cell
    }
    
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
mazePath.configurations[indexPath.row].configure(self.navigationController!)
    }
}





