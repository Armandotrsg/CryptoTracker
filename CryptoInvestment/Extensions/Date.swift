//
//  Date.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 28/07/23.
//

import Foundation

extension Date {
    ///Date Formatter for coinGecko date format: yyyy-MM-dd'T'HH:mm:ss.SSSZ
    ///```
    ///Convert from '2021-03-13T20:49:26.606Z' to a Date()
    ///```
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    ///Converts date into a short date
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    ///Converts a Date() into a short date String
    ///```
    ///Converts a Date() into 'MM/DD/YYYY'
    ///```
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
}
