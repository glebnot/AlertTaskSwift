//
//  Extensions.swift
//  AlertLearning
//
//  Created by Компьютер on 04.08.2021.
//

import Foundation
extension String {
    func localized() -> String {
        
        return NSLocalizedString(self,
                            tableName:"Localizable",
                            bundle: .main,
                            value: self,
                            comment: self)
    }
}
