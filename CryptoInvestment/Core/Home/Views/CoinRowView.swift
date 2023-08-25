//
//  CoinRowView.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 17/07/23.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    @State private var isLoading = true
    
    var body: some View {
        GeometryWrap { geometry in
            HStack(spacing: 0) {
                leftColumn
                Spacer()
                if showHoldingsColumn {
                    centerColumn
                }
                rightColumn
                    .frame(width: geometry.size.width / 3.5, alignment: .trailing)
            }
            .font(.subheadline)
        }
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
    }
}

extension CoinRowView {
    
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .frame(minWidth: 30)
            image
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                        .theme.green : .theme.red
                )
        }
    }
    
    private func stopLoading() {
        isLoading = false
    }
    
    private var image: some View {
//        AsyncImage(url: URL(string: coin.image)) { phase in
//            if let image = phase.image {
//                image
//                    .resizable()
//                    .scaledToFit()
//            } else if phase.error != nil {
//                Image(systemName: "questionmark")
//                    .foregroundColor(.theme.secondaryText)
//            } else {
//                ProgressView()
//            }
//        }
        CoinImageView(coin: coin)
        .frame(width: 30, height: 30)
//        .onAppear {
//            print("IMAGE APPEARED \(coin.name)")
//        }
    }
}
