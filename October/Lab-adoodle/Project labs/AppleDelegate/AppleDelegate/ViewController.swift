//
//  ViewController.swift
//  AppleDelegate
//
//  Created by mac on 10/16/22.
//

import UIKit

class ViewController: UIViewController {
    
    var appleDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateView() {
        
    
        
        
        
        
        didFinishLaunchingWithOptions.text = "The App has launched \(appleDelegate.launchCount) time(s)"
        
        configurationForConnectingOptions.text = "The App has configuration \(appleDelegate.confiurationForConection) time(s)"
        
        sceneWillConnect.text = "The App's screen has connected \(sceneWillConnectVar) time(s)"
        
        sceneDidBecomeActive.text = "The App's screen has become active \(sceneDidBecomeActiveVar) time(s)"
        
        sceneWillResignActive.text = "The App's screen has resinged \(sceneWillResignActiveVar) time(s)"
        
        sceneWillEnterForeground.text = "The App has entered foreground \(sceneWillEnterForegroundVar) time(s)"
        
        sceneDidEnterBackground.text = "The App has entered background \(sceneDidEnterBackgroundVar) time(s)"
    }
    
    
    @IBOutlet weak var didFinishLaunchingWithOptions: UILabel!
    var idFinishLaunching = 0
    
    @IBOutlet weak var configurationForConnectingOptions: UILabel!
    var configurationForConnecting = 0
    
    @IBOutlet weak var sceneWillConnect: UILabel!
    
    var sceneWillConnectVar = 0
    
    @IBOutlet weak var sceneDidBecomeActive: UILabel!
    var sceneDidBecomeActiveVar = 0
    
    @IBOutlet weak var sceneWillResignActive: UILabel!
    var sceneWillResignActiveVar = 0
    
    @IBOutlet weak var sceneWillEnterForeground: UILabel!
    
    var sceneWillEnterForegroundVar = 0
    
    @IBOutlet weak var sceneDidEnterBackground: UILabel!
    var sceneDidEnterBackgroundVar = 0
    
    
    
    
}

