//
//  ViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/29.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var splitStr:[String] = []
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mySystemVersion = UIDevice.current.systemVersion
        print("iOS Version:\(mySystemVersion)")
        
        splitStr = mySystemVersion.components(separatedBy: ".")
        print("split:\(splitStr)");
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if appdelegate.isFirstBoot {
            appdelegate.isFirstBoot = false
            let verNum:Int = Int(self.splitStr[0])!
            if(verNum > 10){
                print("OVER 10 !!")
                let alart:UIAlertController = UIAlertController(title: "iOS 11以上です", message: "Wi-Fiのみ利用可能です。\nBluetoothはApple公式フレームワークの修正待ちです。", preferredStyle: .alert)
            
                let action = UIAlertAction(title: "OK", style: .default, handler:{ action in         })
                alart.addAction(action)
                self.present(alart, animated: true, completion: nil)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

