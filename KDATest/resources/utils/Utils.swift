//
//  Utils.swift
//  KDATest
//
//  Created by Sufiandy Elmy on 07/11/23.
//

import Foundation
import SwiftUI
import MaterialComponents

/**
 utils for basic functionality related to UI and other short computations which can be reused again and again
 */
struct Utils {
    
    //get color object to be used in swiftui  from UIColor
    static func getColor (_ hex:String) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return Color.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        let uiColor = UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
        
        return Color(uiColor)
    }
    
    //get ruppe enabled price symbol
    static func getFormattedPrice(price: Int?)-> String{
        return "Rp "+"\(price ?? 0)"
    }
    
    //show a bottom snackbar message
     static func showToast(msg: String) {
        let message = MDCSnackbarMessage()
        message.text =  msg
        MDCSnackbarManager().show(message)
    }
    
    
}

extension Color {
    //get color object to be used in swiftui  from UIColor
    static func fromHex (_ hex:String) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return Color.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        let uiColor = UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0))
        
        return Color(uiColor)
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

