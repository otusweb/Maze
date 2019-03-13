//
//  Utilities.swift
//  Maze
//
//  Created by Olivier Destrebecq on 1/21/19.
//  Copyright © 2019 MobDesign. All rights reserved.
//

import Foundation
import UIKit

public func stretchInsideContainerController(controller:UIViewController) -> UIViewController
{
    controller.view.translatesAutoresizingMaskIntoConstraints = false
    
    let containingController = UIViewController()
    containingController.addChild(controller)
    containingController.view.addSubview(controller.view)
    controller.didMove(toParent: containingController)
    
    //stretch vertically
    var constraints = NSLayoutConstraint.constraints(
        withVisualFormat: "V:|-[controller]-|",
        options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
        metrics: nil,
        views: [ "controller": controller.view])
    
    containingController.view.addConstraints(constraints)
    
    // stretch horizontally
    constraints = NSLayoutConstraint.constraints(
        withVisualFormat: "H:|-[controller]-|",
        options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
        metrics: nil,
        views: [ "controller": controller.view])
    
    containingController.view.addConstraints(constraints)
    
    return containingController
}

public func topOfContainingController(controller:UIViewController)->UIViewController
{
    controller.view.translatesAutoresizingMaskIntoConstraints = false
    
    let containingController = UIViewController()
    containingController.addChild(controller)
    containingController.view.addSubview(controller.view)
    controller.didMove(toParent: containingController)
    
    //center vertically
    var constraints = NSLayoutConstraint.constraints(
        withVisualFormat: "V:|-[controller]",
        options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
        metrics: nil,
        views: [ "controller": controller.view])
    
    containingController.view.addConstraints(constraints)
    
    // Center horizontally
    constraints = NSLayoutConstraint.constraints(
        withVisualFormat: "H:|-[controller]-|",
        options: NSLayoutConstraint.FormatOptions.alignAllCenterY,
        metrics: nil,
        views: [ "controller": controller.view])
    
    containingController.view.addConstraints(constraints)
    
    return containingController
}
