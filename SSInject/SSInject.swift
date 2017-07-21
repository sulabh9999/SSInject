//
//  SSInject.swift
//  SSInject
//
//  Created by Sulabh on 13/07/17.
//  Copyright © 2017 Sulabh. All rights reserved.
//

import Foundation
//import UIKit
/*
 Public class `Inject` provides singleton class for all classes in project
 */



public class SSInject  {
    
    // variable that contains all registered object
    fileprivate var storage:[AnyObject] = []  // [Weak<AnyObject>]()
    
    
    
    // shared variable for Inject class
    public static var shared  = SSInject()
    
    
    /// function compare multiple class and struct type object and returns true/false
    ///
    /// - Parameters:
    ///   - instance: name of class
    ///   - kind: expected class name
    /// - Returns: if instance class matches with expected class type then return true else false.
    fileprivate func `checkType`<T>(instance: Any, of kind: T.Type) -> Bool{
        return instance is T;
    }
    
    // find stored object in
    public  func resolve<R>(ForObject:R.Type) -> R? {
        for all in storage {
            if `checkType`(instance: all, of: R.self) {
                return (all as? R)
            }
        }
        return nil
    }
    
    //      // find stored object in
    //    public  func resolve<R>(ForObject:R.Type, name: String) -> R {
    //        // pending feature
    //    }
    
    
    /// register object and name pairs for specific class
    ///
    /// - Parameters:
    ///   - forClass: type of class that need to be store
    ///   - object:  object of same class type
    public  func register<R>(forClass: R.Type, object : R) -> Void {
        for all in storage {
            if type(of: all) is R.Type {
                print("\(forClass) ..can not be registered because it is already register")
                return
            }
        }
        storage.append(object as AnyObject)
        print("\(forClass) ..is registered")
    }
    
    
    
    // remove all registrations
    public  func removeAll() {
        storage = []
    }
    
    
    
    /// replace service for associated class (if present)
    /// create new service for class (if not present)
    ///
    /// - Parameters:
    ///   - forClass: type of class that need to be find
    ///   - withObject: object of same class type
    public  func replaceService<R>(_ forClass: R.Type, withObject : R) -> Void {
        for i in 0..<storage.count {
            if type(of: storage[i]) is R.Type {
                storage[i] = withObject as AnyObject
                return
            }
        }
        self.register(forClass: forClass, object: withObject)
        //return false
    }
    
    
}







