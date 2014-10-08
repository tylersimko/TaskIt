//
//  Date.swift
//  TaskIt
//
//  Created by Tyler Simko on 10/7/14.
//  Copyright (c) 2014 O8 Labs. All rights reserved.
//

import Foundation

class Date {
    
    class func from(#year: Int, month: Int, day: Int) -> NSDate {
        //# is an identifier for year
        
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        var date = gregorianCalendar.dateFromComponents(components)
        
        return date!
    }
    
    class func toString(#date: NSDate) -> NSString {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormatter.stringFromDate(date)
        
        return dateString
    }
}