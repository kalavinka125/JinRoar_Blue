//
//  OtherViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/12/02.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    private let list = ["このアプリについて","オプション","クレジット","開発サポート"]
    private let CELL_ID = "OTHER_CELL"
    
    private let GO_TO_ABOUTAPP_SEGUE = "GO_TO_ABOUTAPP"
    private let GO_TO_CREDIT_SEGUE = "GO_TO_CREDIT"
    private let GO_TO_OPTION = "GO_TO_OPTION"
    private let GO_TO_SUPPORT_SEGUE = "GO_TO_SUPPORT"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
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
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: self.CELL_ID, for: indexPath) as! OtherTableViewCell
        cell.numberLabel.text = "□"
        cell.nameLabel.text = list[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.performSegue(withIdentifier: self.GO_TO_ABOUTAPP_SEGUE, sender: self)
        }else if indexPath.row == 1 {
            //self.performSegue(withIdentifier: self.GO_TO_OPTION, sender: self)
        }else if indexPath.row == 2 {
            self.performSegue(withIdentifier: self.GO_TO_CREDIT_SEGUE, sender: self)
        }else if indexPath.row == 3 {
            self.performSegue(withIdentifier: self.GO_TO_SUPPORT_SEGUE, sender: self)
        }
    }

}
