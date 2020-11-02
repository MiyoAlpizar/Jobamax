//
//  String+Extensions.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import SwiftUI
import Foundation

extension String {
    
    var length: Int {
        return self.count
    }
    
    func isMoreThan(characters: Int) -> Bool {
        return self.length > characters
    }
    
    func isLessThan(characters: Int) -> Bool {
        return self.length < characters
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func localizable() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func forSearch() -> String {
        return self.lowercased().folding(options: [.diacriticInsensitive, .caseInsensitive], locale: nil)
    }
    
    var asURL: URL? {
        return URL(string: self)
    }
    
    func isEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isNumber() -> Bool {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
        return !self.isEmpty && self.rangeOfCharacter(from: numberCharacters) == nil
    }
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValidForCall(regex: RegularExpressions) -> Bool {
        return isValidForCall(regex: regex.rawValue)
    }
    
    func isValidForCall(regex: String) -> Bool {
        let matches = range(of: regex, options: .regularExpression)
        return matches != nil
    }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter{CharacterSet.decimalDigits.contains($0)}
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.regularExpression, range: nil)
    }
    
    func stringByReplacing(replaceStrings set: [String], with: String) -> String {
        var stringObject = self
        for string in set {
            stringObject = self.replace(target: string, withString: with)
        }
        return stringObject
    }
    
    func returnOnlyNumbers() -> String {
        var numbers = ""
        for ch in self.substring(toIndex: self.length) {
            if (ch.description.isNumber()) {
                numbers += ch.description
            }
        }
        return numbers
    }
    
    func phoneFormat(shouldRemoveLastDigit: Bool = false) -> String {
        let phoneNumber = self
        guard !phoneNumber.isEmpty else { return "" }
        guard let regex = try? NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive) else { return "" }
        let r = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex.stringByReplacingMatches(in: phoneNumber, options: .init(rawValue: 0), range: r, withTemplate: "")
        
        if number.count > 10 {
            let tenthDigitIndex = number.index(number.startIndex, offsetBy: 10)
            number = String(number[number.startIndex..<tenthDigitIndex])
        }
        
        if shouldRemoveLastDigit {
            let end = number.index(number.startIndex, offsetBy: number.count-1)
            number = String(number[number.startIndex..<end])
        }
        
        if number.count < 7 {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d+)", with: "($1) $2", options: .regularExpression, range: range)
            
        } else {
            let end = number.index(number.startIndex, offsetBy: number.count)
            let range = number.startIndex..<end
            number = number.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: range)
        }
        
        return number
    }
    
    func toObject<T: Decodable>(_ type: T.Type) -> T? {
        let decoder: JSONDecoder = JSONDecoder()
        do{
            let obj = try decoder.decode(type, from: self.data(using: String.Encoding.utf8)!)
            return obj
        }catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
