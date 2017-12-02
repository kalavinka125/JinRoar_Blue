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
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var roleTableView: UITableView!
    
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    private let CELL_ID = "roleCell"
    
    var day:Int = 0
    var phase:String = ""
    var time:String = ""
    var updated:Date = Date()
    
    var players:[Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.roleTableView.delegate = self
        self.roleTableView.dataSource = self
        //デリゲートの移譲
        appdelegate.session!.delegate = self
        
        //画面部品イニシャライズ
        self.dayLabel.text = "\(day) 日"
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103;
    }
    
    //セルの内容を変えろ indexPathの番号 = 配列インデックス
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.CELL_ID, for: indexPath) as! RoleTableViewCell
        //名前
        cell.playerNameLabel.text = self.players[indexPath.row].name
        //生死により画面のハイライトオン・オフ
        switch self.players[indexPath.row].isAlive{
        case 0:
            cell.playerNameLabel.textColor = UIColor.red
            cell.roleCellImageView.isHighlighted = false
        case 1:
            cell.playerNameLabel.textColor = UIColor.green
            cell.roleCellImageView.isHighlighted = true
        default:
            print("isAliveError")
        }
        //ターゲットネーム
        if self.players[indexPath.row].targetID != -1 {
            cell.abilityTargetLabel.text = "対象：\(self.players[players[indexPath.row].targetID].name)"
        }else{
            cell.abilityTargetLabel.text = "対象："
        }
        //人狼投票
        if self.players[indexPath.row].killVote != -1 {
            cell.warewolfKillVoteLabel.text = "人狼：\(String(self.players[indexPath.row].killVote))"
        }else{
            cell.warewolfKillVoteLabel.text = ""
        }
        /*
        switch self.players[indexPath.row].roleID {
            
        }
        */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        
    }
    
    //受信タイミング
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        DispatchQueue.main.async() {
            
            self.players.removeAll()
            
            let msg = NSString(data: data, encoding:String.Encoding.utf8.rawValue)
            print("***** GET DATA : \(msg) *****")
            
            //タイムスタンプデータフォーマッター
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            //JSONデコーダ
            let decoder: JSONDecoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            do{
                //受け取ったデータをJSONデコード
                let decodeData = try decoder.decode(Forecast.self, from:data)
                //日付
                self.day = decodeData.day
                self.dayLabel.text = "\(self.day) 日"
                // NIGHT or DAY
                self.time = decodeData.time
                self.timeLabel.text = "\(self.time)"
                //タイムスタンプ
                self.updated = decodeData.updated
                //プレイヤー配列を格納
                for value in decodeData.players {
                    let tempPlayer = Player(id: value.id, name: value.name, isAlive: value.isAlive, roleID: value.roleID, targetID: value.targetID, killVote: value.killVote)
                    self.players.append(tempPlayer)
                }
            }catch{
                print(error)
            }
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
