//
//  Player.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/11/30.
//  Copyright © 2017年 sotuken. All rights reserved.
//

import UIKit

class Player: NSObject {
    //プレイヤーID
    var id:Int = 0
    //プレイヤーネーム
    var name:String = "Player"
    //生死判定
    var isAlive:Bool = true
    //役職ID
    var roleID:Int = -1
    //ターゲットID
    var target:Int = -1
}
