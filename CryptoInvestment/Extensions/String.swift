//
//  String.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 28/07/23.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
