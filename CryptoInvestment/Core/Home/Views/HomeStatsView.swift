//
//  HomeStatsView.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 25/07/23.
//

import SwiftUI

struct HomeStatsView: View {

    @EnvironmentObject private var vm: HomeViewModel
    
    
    var body: some View {
        GeometryWrap { geometry in
            HStack {
                ForEach(vm.statistics) { stat in
                    StatisticView(stat: stat)
                        .frame(width: geometry.size.width / 3)
                }
            }
            .frame(width: geometry.size.width,
                   alignment: vm.showPortfolio ? .trailing : .leading
            )
        }
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView()
            .environmentObject(dev.homeVM)
    }
}
