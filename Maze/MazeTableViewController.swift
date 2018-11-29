//
//  MazeTableTableViewController.swift
//  Maze
//
//  Created by Olivier Destrebecq on 9/24/18.
//  Copyright © 2018 MobDesign. All rights reserved.
//

import UIKit

@objc public protocol MazeProtocol: NSObjectProtocol{
   @objc static func configurations() -> NSDictionary
}

let classCellReuseIdentifier = "classCell"

func getAllClasses() -> [AnyClass] {
    let expectedClassCount = objc_getClassList(nil, 0)
    let allClasses = UnsafeMutablePointer<AnyClass?>.allocate(capacity: Int(expectedClassCount))

    let autoreleasingAllClasses = AutoreleasingUnsafeMutablePointer<AnyClass>(allClasses)
    let actualClassCount: Int32 = objc_getClassList(autoreleasingAllClasses, expectedClassCount)

    var classes = [AnyClass]()
    for i in 0 ..< actualClassCount {
        if let currentClass: AnyClass = allClasses[Int(i)] {
            classes.append(currentClass)
        }
    }

    allClasses.deallocate()
    return classes
}

// https://stackoverflow.com/questions/34415028/how-to-list-all-classes-conforming-to-protocol-in-swift
func getClassesImplementingProtocol(_ p: Protocol) -> [AnyClass] {
    let classes = getAllClasses()
    var ret = [AnyClass]()

    for cls in classes {
        if class_conformsToProtocol(cls, p) {
            ret.append(cls)
        }
    }
    return ret
}

// https://github.com/sushinoya/lumos/blob/945fec6393577f7e7350cbfb9bc04fa443504263/Lumos/Lumos/Sources/RuntimeQueries.swift

@objc public class MazeTableViewController: UITableViewController {
    var viewControllerClasses: [MazeProtocol.Type]!

    public override func viewDidLoad() {
        super.viewDidLoad()

        // 1 get all the classes which implemented the Maze protocol
        if let controllers = getClassesImplementingProtocol(MazeProtocol.self) as? [MazeProtocol.Type]
        { self.viewControllerClasses = controllers }
        self.tableView.reloadData()

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
        return self.viewControllerClasses.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: classCellReuseIdentifier, for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = String(describing: viewControllerClasses[indexPath.row])

        return cell
    }

    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ConfigurationsTableViewController(inClass: viewControllerClasses[indexPath.row])
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
