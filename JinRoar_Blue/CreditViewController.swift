//
//  CreditViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/12/01.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class CreditViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    let CELL_ID = "CREDIT_CELL"
    private let sections : [String] = ["　開発者","　素材提供"]
    private let staffList:[Credit] = [Credit(name: "宮脇流士", position: "プロデューサー"),Credit(name: "秋山裕太", position: "プランナー"),Credit(name: "宇崎裕太", position: "クリエイター"),Credit(name: "瀬尾敦生", position: "テクニカルサポート"),Credit(name: "香川聖雄", position: "デバッガー")]
    private let specialThx:[Credit] = [Credit(name:"テスト",position:"テスト"),Credit(name:"テスト",position:"テスト"),Credit(name:"テスト",position:"テスト")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.staffList.count
        }else if section == 1 {
            return self.specialThx.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.CELL_ID, for: indexPath) as! CreditTableViewCell
        cell.nameLabel.adjustsFontSizeToFitWidth = true
        cell.positionLabel.adjustsFontSizeToFitWidth = true
        
        
        if indexPath.section == 0 {
            cell.nameLabel.text = self.staffList[indexPath.row].name
            cell.positionLabel.text = self.staffList[indexPath.row].position
        }else if indexPath.section == 1 {
            cell.nameLabel.text = self.specialThx[indexPath.row].name
            cell.positionLabel.text = self.specialThx[indexPath.row].position
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let font = UIFont(name: "PixelMplus10-Regular", size: 17.0)
        label.font = font
        label.textColor = UIColor.black
        label.backgroundColor = #colorLiteral(red: 1, green: 0.4352941176, blue: 0.8117647059, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        if section == 0 {
            label.text = self.sections[section]
        }else if section == 1 {
            label.text = self.sections[section]
        }
        return label
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
}
