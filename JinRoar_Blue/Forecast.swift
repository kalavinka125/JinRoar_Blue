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
}

struct Forecast: Codable {
    //Day
    let day:Int
    //夜か昼か
    let time:String
    //フェーズ(投票、技能
    let phase:String
    //送ってきた時間
    let updated: Date
    //プレイヤー
    let players:[Player]
}


