//
//  privacyPolicyViewController.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/12/03.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class PrivacyPolicyViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let font = UIFont(name: "PixelMplus10-Regular", size: 17)
        self.textView.font = font
        
        titleLabel.layer.borderColor = UIColor.black.cgColor
        titleLabel.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
