//
//  DateExtension.swift
//  MyDiary
//
//  Created by Vo Minh Don on 1/12/22.
//

import Foundation

extension Date {
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }

    func getWeekDay() -> String{
        let day = self.get(.weekday)
        switch day{
        case 2:
            return "MON"
        case 3:
            return "TUE"
        case 4:
            return "WED"
        case 5:
            return "THU"
        case 6:
            return "FRI"
        case 7:
            return "SAT"
        case 8:
            return "SUN"
        default:
            return "WRONG INPUT"
        }
    }

    func toString() -> String{
        let day = self.get(.day)
        let month = self.get(.month)
        let year = self.get(.year)
        return "\(day).\(month).\(year)"
    }
}
