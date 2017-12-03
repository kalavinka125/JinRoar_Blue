//
//  SearchStartViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/29.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class SearchStartViewController:UIViewController,MCBrowserViewControllerDelegate,MCSessionDelegate,UITableViewDelegate,UITableViewDataSource{
    
    //Appdelegateクラス参照
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    
    let serviceType = "JinRoar"
    var browser : MCBrowserViewController?
    var assistant : MCAdvertiserAssistant!
    
    var peerID : MCPeerID = MCPeerID(displayName: UIDevice.current.name)
    
    @IBOutlet weak var introTextView: UITextView!
    //説明 テーブル
    @IBOutlet weak var descriptionTableView: UITableView!
    private let CELL_ID = "DESCRIPTION_CELL"
    private let descriptionText = ["まず、「狼狂する猜疑心」を別デバイスで起動するがいい。","「狼狂する猜疑心」タイトル画面から「Connect \"HERMIT\"」を押し給え。","さすれば、ブラウザが表示されるであろう。このアプリが入っている端末を選択せよ。","このアプリに接続要請が来るゆえ、許可せよ。","時が経てば次の画面に移るだろう。しばし待たれよ。"]
    
    
    @IBOutlet weak var manualTableView: UITableView!
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
        
        self.descriptionTableView.delegate = self
        self.descriptionTableView.dataSource = self
        self.descriptionTableView.reloadData()
        
        let font = UIFont(name: "PixelMplus10-Regular", size: 17)
        self.introTextView.font = font
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
    @IBAction func backButtonTapped(_ sender: Any) {
        assistant.stop()
        self.dismiss(animated: true, completion:nil)
    }
    
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
        if(state == .connected){
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "goToWatchGame", sender: self)
            }
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
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.descriptionText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.CELL_ID,for:indexPath) as! DescriptionTableViewCell
        cell.numberLabel.text = String("\(indexPath.row + 1).")
        cell.descriptionTextView.text = descriptionText[indexPath.row]
        return cell
    }
    

}
