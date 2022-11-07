//
//  DateUtils.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import Foundation

struct DateUtils{
    
    //Convert Milisecond to dd/MM/yy hh:mm a
    public static func formatDateFrom(milisecond: Int) -> String? {
        let dateVar = Date.init(timeIntervalSinceNow: TimeInterval(milisecond)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy hh:mm a"
        return dateFormatter.string(from: dateVar)
    }
}
