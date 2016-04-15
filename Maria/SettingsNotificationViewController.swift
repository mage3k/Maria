//
//  SettingsNotificationViewController.swift
//  Maria
//
//  Created by ShinCurry on 16/4/15.
//  Copyright © 2016年 ShinCurry. All rights reserved.
//

import Cocoa

class SettingsNotificationViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        notificationWhenStarted.state = checkButtonState(by: defaults.boolForKey("EnableNotificationWhenStarted"))
        notificationWhenPaused.state = checkButtonState(by: defaults.boolForKey("EnableNotificationWhenStopped"))
        notificationWhenStopped.state = checkButtonState(by: defaults.boolForKey("EnableNotificationWhenPaused"))
        notificationWhenCompleted.state = checkButtonState(by: defaults.boolForKey("EnableNotificationWhenCompleted"))
        notificationWhenError.state = checkButtonState(by: defaults.boolForKey("EnableNotificationWhenError"))
    }
    
    @IBOutlet weak var notificationWhenStarted: NSButton!
    @IBOutlet weak var notificationWhenStopped: NSButton!
    @IBOutlet weak var notificationWhenPaused: NSButton!
    @IBOutlet weak var notificationWhenCompleted: NSButton!
    @IBOutlet weak var notificationWhenError: NSButton!
    
    let defaults = NSUserDefaults(suiteName: "group.windisco.maria")!
    
    @IBAction func switchNotification(sender: NSButton) {
        print(sender.state)
        let boolValue = sender.state == 0 ? false : true
        
        var key = ""
        switch sender {
        case notificationWhenStarted:
            key = "EnableNotificationWhenStarted"
        case notificationWhenStopped:
            key = "EnableNotificationWhenStopped"
        case notificationWhenPaused:
            key = "EnableNotificationWhenPaused"
        case notificationWhenCompleted:
            key = "EnableNotificationWhenCompleted"
        case notificationWhenError:
            key = "EnableNotificationWhenError"
        default:
            break
        }
        defaults.setBool(boolValue, forKey: key)
        defaults.synchronize()
    }
    
    func checkButtonState(by value: Bool) -> Int {
        return value ? 1 : 0
    }
}