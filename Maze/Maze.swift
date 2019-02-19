//
//  MazeProtocol.swift
//  Maze
//
//  Created by Olivier Destrebecq on 06/12/2018.
//  Copyright © 2018 MobDesign. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol MazeProtocol: AnyObject{
    static func registerWithMaze(_ maze:Maze)
}

fileprivate func getAllClasses() -> [AnyClass] {
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
fileprivate func getClassesImplementingProtocol(_ p: Protocol) -> [AnyClass] {
    let classes = getAllClasses()
    var ret = [AnyClass]()
    
    for cls in classes {
        if class_conformsToProtocol(cls, p) {
            ret.append(cls)
        }
    }
    return ret
}

public struct MazePath {
    let label:String
    let configurations:[MazeConfiguration]
    
    public init ( label:String,
                  configurations:[MazeConfiguration])
    {
        self.label = label
        self.configurations = configurations
    }
}

public struct MazeConfiguration
{
    let label:String
    let configure:(UINavigationController)->Void
    
    public init(label:String, configure:@escaping ((UINavigationController)-> Void))
    {
        self.label = label
        self.configure = configure
    }
}

public class Maze:NSObject {
    private(set) public var mazePaths:[MazePath]=[]
    
    override init()
    {
        super.init()
        
        for currentClass in getClassesImplementingProtocol(MazeProtocol.self) as? [MazeProtocol.Type] ?? []
        {
            currentClass.registerWithMaze(self)
        }
    }
    
    public func addConfiguration (_ path:MazePath){
        mazePaths.append(path)
    }
}
