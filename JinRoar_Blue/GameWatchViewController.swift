//
//  GameWatchViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/30.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class GameWatchViewController: UIViewController , MCSessionDelegate,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var phaseLabel: UILabel!
    @IBOutlet weak var roleTableView: UITableView!
    
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    private let CELL_ID = "roleCell"
    
    var playerList:[Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.roleTableView.delegate = self
        self.roleTableView.dataSource = self
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
    
    
    //セルの内容を変えろ indexPathの番号 = 配列インデックス
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.CELL_ID, for: indexPath) as! RoleTableViewCell
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    //受信タイミング
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async() {
            let msg = NSString(data: data, encoding:String.Encoding.utf8.rawValue)
            print("***** GET DATA : \(msg) *****")
            self.roleTableView.reloadData()
        }
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }

}
