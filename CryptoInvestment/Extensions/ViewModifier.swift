//
//  ViewBuilder.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 25/07/23.
//

import Foundation
import SwiftUI

struct AllScreenFrame: ViewModifier {
    let geometry: GeometryProxy
    func body(content: Content) -> some View {
        content
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
    }
}

struct ChartShadow: ViewModifier {
    let lineColor: Color
    func body(content: Content) -> some View {
        content
            .shadow(color: lineColor,radius: 10, x: 0, y: 10)
            .shadow(color: lineColor.opacity(0.5),radius: 10, x: 0, y: 20)
            .shadow(color: lineColor.opacity(0.2),radius: 10, x: 0, y: 30)
            .shadow(color: lineColor.opacity(0.1),radius: 10, x: 0, y: 40)
    }
    
    
}

extension View {
    func allScreenFrame(geometry: GeometryProxy) -> some View {
        return self.modifier(AllScreenFrame(geometry: geometry))
    }
    
    func chartShadow(lineColor: Color) -> some View {
        return self.modifier(ChartShadow(lineColor: lineColor))
    }
}
