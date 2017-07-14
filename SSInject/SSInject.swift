//
//  SSInject.swift
//  SSInject
//
//  Created by Sulabh on 13/07/17.
//  Copyright © 2017 Sulabh. All rights reserved.
//

import Foundation

/*
     Public class `Inject` provides singleton class for all classes in project
*/
public class SSInject  {
    
    // variable that contains all registered object
    fileprivate var storage : [ String : [String:Any]] = [:]
    
    // shared variable for Inject class
    public static var shared  = SSInject()
    
    // find stored object in
    public  func resolve<N>(ForObject:N.Type, name: String) -> Any? {
        if let value = storage["\(ForObject.self)"] {
            if let nameValue = value[name] {
                // returns true if object with associated name is present
                return nameValue
            }
        }
        // return nil iff no object present in storage with related name
        return nil
        
    }
    
    // register object and name pairs for specific class
    public  func register<R>(regController: R.Type, pairs : [String:Any]) -> Void {
        if storage["\(regController.self)"] == nil {
            storage["\(regController.self)"] = pairs
        }else {
            print("Could not register :\(regController.self) because it is repeating in Injection")
        }
    }
    
    // remove all registrations
    public  func removeAll() {
        storage = [:]
    }
    
    // replace service for associated classes class
    public  func replaceService<M>(_ replaceObject: M.Type, pairs : [String:Any]) -> Bool {
        if storage["\(replaceObject.self)"] != nil {
            storage["\(replaceObject.self)"] = pairs
            return true
        }else{
            return false
        }
    }
}

