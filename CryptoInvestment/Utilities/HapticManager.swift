//
//  HapticManager.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 26/07/23.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
