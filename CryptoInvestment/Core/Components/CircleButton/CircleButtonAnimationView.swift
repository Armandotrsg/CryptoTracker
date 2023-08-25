//
//  CircleButtonAnimationView.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 17/07/23.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @EnvironmentObject private var vm: HomeViewModel
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(vm.showPortfolio ? 1.0 : 0.0)
            .opacity(vm.showPortfolio ? 0.0 : 1.0)
            .animation(vm.showPortfolio ? Animation.easeOut(duration: 1.0) : .none, value: vm.showPortfolio) 
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView()
            .environmentObject(dev.homeVM)
    }
}
