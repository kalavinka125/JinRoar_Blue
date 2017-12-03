//
//  Forecast.swift
//  JinRoar_Blue
//
//  Created by sotuken on 2017/12/01.
//  Copyright © 2017年 sotuken. All rights reserved.
//
import Foundation

struct Player : Codable{
    let id:Int
    let name:String
    let isAlive:Int
    let roleID:Int
    let targetID:Int
    let killVote:Int
    let isWin:Int
}

struct Forecast: Codable {
    //Day
    let day:Int
    //夜か昼か夕方か
    let time:String
    //送ってきた時間
    let updated: Date
    //プレイヤー
    let players:[Player]
}

struct Credit:Codable{
    let name:String
    let position:String
}

