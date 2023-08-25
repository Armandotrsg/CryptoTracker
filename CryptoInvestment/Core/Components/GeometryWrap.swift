//
//  GeometryWrap.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 27/07/23.
//

import SwiftUI

struct GeometryWrap<Content: View>: View {
    
    let content: (GeometryProxy) -> Content
    
    init(@ViewBuilder content: @escaping (GeometryProxy) -> Content) {
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                content(geometry)
            }
            .allScreenFrame(geometry: geometry)
        }
    }
}
