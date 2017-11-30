//
//  GameWatchViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/30.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class GameWatchViewController: UIViewController , MCSessionDelegate{
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var phaseLabel: UILabel!
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var roleTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //デリゲートの移譲
        appdelegate.session!.delegate = self
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
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }

}
