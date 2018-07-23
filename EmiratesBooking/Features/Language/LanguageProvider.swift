//
//  LanguageProvider.swift
//  EmiratesBooking
//
//  Created by rafal.manka on 23/07/2018.
//  Copyright © 2018 Emirates Airlines. All rights reserved.
//

import Foundation

fileprivate let fallbackLanguage = "en"
fileprivate let supportedLanguages = [fallbackLanguage, "pl", "de"]

class LanguageProvider {
    var deviceCode: String {
        get {
            if let languageCode = Locale.current.languageCode, supportedLanguages.contains(languageCode) {
                return languageCode
            }
            return fallbackLanguage
        }
    }
}
