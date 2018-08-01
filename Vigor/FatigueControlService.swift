//
//  FatigueControlService.swift
//  Vigor
//
//  Created by Алексей Россошанский on 25.07.2018.
//  Copyright © 2018 Rentateam. All rights reserved.
//

import Cocoa

class FatigueControlService {
    
    var isStarted = true
    let objcClass = MyOCPPClass()

    func startFC() {
        objcClass.startDetect()
        print("analyzing started")
    }
    
    func stopFC() {
        objcClass.stopDetect()
        print("analyzing finished")
    }
    
    func exit() {
        isStarted = false
        print("left the app")
        objcClass.stopDetect()
        NSApplication.shared.terminate(self)
    }
    
    func currentStatus() -> String {
        print("status" + objcClass.getStatus())
        guard let status = objcClass.getStatus() else {
            return "NON"
        }
        if status == "" {
            return "ERR"
        }
        return status
    }
}
