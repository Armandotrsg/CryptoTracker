//
//  UIApplication.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 24/07/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditting() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
