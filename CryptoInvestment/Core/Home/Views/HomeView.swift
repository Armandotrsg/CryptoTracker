//
//  HomeView.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 17/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
//    @State private var showPortfolio: Bool = false //animate right
    @State private var showPortfolioView: Bool = false // New sheet
    @State private var showSettingsView: Bool = false
    
    var body: some View {
        ZStack {
            //Background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            //Content Layer
            VStack {
                homeHeader
                HomeStatsView()
                    .frame(height: 70)
                SearchBarView(searchText: $vm.searchText)
                columnTitles
                if !vm.showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                } else {
                    ZStack(alignment: .top) {
                        if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty {
                            portfolioEmptyText
                        } else {
                            portfolioCoinsList
                        }
                    }
                    .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
                .toolbar(.hidden)
        }
        .environmentObject(dev.homeVM)
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: vm.showPortfolio ? "plus" : "info")
                .animation(.none, value: vm.showPortfolio)
                .onTapGesture {
                    if vm.showPortfolio {
                        showPortfolioView.toggle()
                    } else {
                        showSettingsView.toggle()
                    }
                }
                .background(
                    CircleButtonAnimationView()
                )
            Spacer()
            Text(vm.showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
                .animation(.none, value: vm.showPortfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: vm.showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        vm.showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                NavigationLink(value: coin) {
                    CoinRowView(coin: coin, showHoldingsColumn: false)
                }
                .listRowInsets(.init(top: ListStyling.top, leading: ListStyling.leading, bottom: ListStyling.bottom, trailing: ListStyling.trailing))
                .listRowBackground(Color.theme.background)
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            vm.reloadData()
        }
        .navigationDestination(for: CoinModel.self) { coin in
            DetailView(coin: coin)
        }
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                NavigationLink(value: coin) {
                    CoinRowView(coin: coin, showHoldingsColumn: true)
                }
                .listRowInsets(.init(top: ListStyling.top, leading: ListStyling.leading, bottom: ListStyling.bottom, trailing: ListStyling.trailing))
                .listRowBackground(Color.theme.background)
            }
            .onDelete(perform: vm.deleteFromPortfolio)
        }
        .listStyle(PlainListStyle())
        .refreshable {
            vm.reloadData()
        }
        .navigationDestination(for: CoinModel.self) { coin in
            DetailView(coin: coin)
        }
        
    }
    
    private var portfolioEmptyText: some View {
        Text("You haven't added any coins to your portfolio yet! Click the + button to get started! 🧐")
            .font(.callout)
            .foregroundColor(.theme.accent)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(50)
    }
    
    private var columnTitles: some View {
        GeometryReader { geometry in
            HStack {
                HStack(spacing: 4) {
                    Text("Coin")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                    }
                }
                Spacer()
                if vm.showPortfolio {
                    HStack(spacing: 4) {
                        Text("Holdings")
                        Image(systemName: "chevron.down")
                            .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0)
                            .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                    }
                    .onTapGesture {
                        withAnimation(.default) {
                            vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                        }
                    }
                }
                HStack(spacing: 4) {
                    Text("Price")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
                }
                .frame(width: geometry.size.width / 3.5, alignment: .trailing)
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                    }
                }
                Button {
                    withAnimation(.linear(duration: 2.0)) {
                        vm.reloadData()
                    }
                } label: {
                    Image(systemName: "goforward")
                }
                .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)

            }
            .font(.caption)
            .foregroundColor(.theme.secondaryText)
            .padding(.horizontal)
        }
        .frame(height: 20)
    }
    
    private struct ListStyling {
        static let top: CGFloat = 25
        static let bottom: CGFloat = 25
        static let leading: CGFloat = 0
        static let trailing: CGFloat = 10
    }
}
