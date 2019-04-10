//
//  Extensions.swift
//  GithubRepoTask
//
//  Created by Ali Jaber on 4/10/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
extension UIViewController {
    func showloader()  {
        SVProgressHUD.show()
    }
    
    func hideLoader()  {
        SVProgressHUD.dismiss()
    }
    
    
}

extension Int {
    func formatUsingAbbrevation () -> String {
        let numFormatter = NumberFormatter()
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        let startValue = Double (abs(self))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        return numFormatter.string(from: NSNumber (value:value))!
    }
}

extension UILabel {
    func addStarToLabel(withText text: String)  {
        let imageAttachment =  NSTextAttachment()
        imageAttachment.image = UIImage(named:"star")
        //Set bound to reposition
        let imageOffsetY:CGFloat = -2.0;
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image!.size.width, height: imageAttachment.image!.size.height)
        //Create string with attachment
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        //Initialize mutable string
        let completeText = NSMutableAttributedString(string: "")
        //Add image to mutable string
        completeText.append(attachmentString)
        //Add your text to mutable string
        let  textAfterIcon = NSMutableAttributedString(string: text)
        completeText.append(textAfterIcon)
        self.textAlignment = .center;
        self.attributedText = completeText;
    }
}

extension Dictionary where Key:
ExpressibleByStringLiteral {
    subscript(jsonKey:APIKeys) ->Value? {
        get {
            return self[jsonKey.rawValue as! Key]
        }
        set {
            self[jsonKey.rawValue as! Key] = newValue
        }
    }
}

extension Date {
    
    static var finalDateForMonthAgo: String {
        let date = Calendar.current.date(byAdding: .day, value: -30, to: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let finalDate = date {
            var stringDate:String = formatter.string(from: finalDate)
            stringDate = "created:>" + stringDate
            return stringDate
        }
        return ""
    }
    
}

