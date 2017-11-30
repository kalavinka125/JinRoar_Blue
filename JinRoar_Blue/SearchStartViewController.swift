//
//  SearchStartViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/29.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class SearchStartViewController:UIViewController,MCBrowserViewControllerDelegate,MCSessionDelegate{
    
    //Appdelegateクラス参照
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    let serviceType = "JinRoar"
    var browser : MCBrowserViewController?
    var assistant : MCAdvertiserAssistant!
    
    var peerID : MCPeerID = MCPeerID(displayName: UIDevice.current.name)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        appdelegate.session = MCSession(peer: peerID)
        appdelegate.session!.delegate = self
        
        self.browser = MCBrowserViewController(serviceType: serviceType, session: appdelegate.session!)
        self.browser!.delegate = self
        
        assistant = MCAdvertiserAssistant(serviceType: serviceType, discoveryInfo: nil, session: appdelegate.session!)
        assistant.start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        self.dismiss(animated: true, completion: nil)
    }
    //多分ここが繋がったとき呼ばれる
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        //TODO 遷移
        print("****** MCSESSION_STATE:\(state.rawValue) ******")
        //Connented(完了)時
        if(state.rawValue == 2){
            self.performSegue(withIdentifier: "goToWatchGame", sender: self)
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("receivedData")
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }

}
