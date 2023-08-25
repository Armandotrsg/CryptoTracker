//
//  MarketDataModel.swift
//  CryptoInvestment
//
//  Created by Armando Terrazas Gómez on 25/07/23.
//

import Foundation

//JSON Data
/*
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 {
 "data": {
 "active_cryptocurrencies": 10022,
 "upcoming_icos": 0,
 "ongoing_icos": 49,
 "ended_icos": 3376,
 "markets": 781,
 "total_market_cap": {
 "btc": 41816788.054615796,
 "eth": 657525048.7059176,
 "ltc": 13692566840.804422,
 "bch": 5160783200.427235,
 "bnb": 5142129284.487714,
 "eos": 1648076631116.3875,
 "xrp": 1743664688602.6946,
 "xlm": 8417513909430.155,
 "link": 163851161611.73502,
 "dot": 235721641049.74866,
 "yfi": 187131588.36657688,
 "usd": 1224196571787.8098,
 "aed": 4496351588519.445,
 "ars": 332541980957012.56,
 "aud": 1804037278015.1086,
 "bdt": 132884566911086.23,
 "bhd": 461525780153.7202,
 "bmd": 1224196571787.8098,
 "brl": 5810649027990.825,
 "cad": 1612205675215.9558,
 "chf": 1059392780900.5927,
 "clp": 1014418247246251.8,
 "cny": 8736233995249.357,
 "czk": 26700706587949.58,
 "dkk": 8263865506059.287,
 "eur": 1108988656613.4297,
 "gbp": 950603328352.0975,
 "hkd": 9563882692520.777,
 "huf": 421115452855478.56,
 "idr": 18397801120234476,
 "ils": 4549291969266.43,
 "inr": 100212796248968.66,
 "jpy": 172816683205271.47,
 "krw": 1563650907684020.8,
 "kwd": 375767137710.2683,
 "lkr": 406660762851864.44,
 "mmk": 2571445097059532.5,
 "mxn": 20705441371753.72,
 "myr": 5585396858781.898,
 "ngn": 971179624330704.4,
 "nok": 12325736265088.99,
 "nzd": 1967379378195.6106,
 "php": 66749927726622.96,
 "pkr": 352844056903541.8,
 "pln": 4914597123074.191,
 "rub": 110636783538272.11,
 "sar": 4590052818320.66,
 "sek": 12720581282173.99,
 "sgd": 1625875054136.5383,
 "thb": 42136846000936.3,
 "try": 32955738971499.4,
 "twd": 38327758367818.664,
 "uah": 45266699183967.09,
 "vef": 122578802733.11334,
 "vnd": 28971641843023244,
 "zar": 21532026242204.27,
 "xdr": 910744712171.2584,
 "xag": 49654086259.82803,
 "xau": 623544523.8401232,
 "bits": 41816788054615.8,
 "sats": 4181678805461579.5
 },
 "total_volume": {
 "btc": 1114672.7725349583,
 "eth": 17527057.986733805,
 "ltc": 364990525.42307776,
 "bch": 137566388.6704728,
 "bnb": 137069147.89311364,
 "eos": 43931306855.92672,
 "xrp": 46479312334.499855,
 "xlm": 224378150589.22018,
 "link": 4367634079.36268,
 "dot": 6283421262.107447,
 "yfi": 4988199.623582001,
 "usd": 32632314682.329723,
 "aed": 119855228596.7288,
 "ars": 8864274592622.73,
 "aud": 48088610531.615265,
 "bdt": 3542185220740.2544,
 "bhd": 12302480532.182365,
 "bmd": 32632314682.329723,
 "brl": 154889281639.67764,
 "cad": 42975126820.89412,
 "chf": 28239287215.165165,
 "clp": 27040441238365.727,
 "cny": 232873987267.50986,
 "czk": 711736889073.3574,
 "dkk": 220282482324.18542,
 "eur": 29561320179.890327,
 "gbp": 25339383938.605263,
 "hkd": 254935879416.3653,
 "huf": 11225298527917.836,
 "idr": 490413753357962.06,
 "ils": 121266413045.16669,
 "inr": 2671283009408.1953,
 "jpy": 4606619981360.627,
 "krw": 41680845747131.96,
 "kwd": 10016488991.74111,
 "lkr": 10839992765997.094,
 "mmk": 68544715390793.516,
 "mxn": 551926458585.6964,
 "myr": 148884935738.1298,
 "ngn": 25887867883785.79,
 "nok": 328556143484.695,
 "nzd": 52442675015.0491,
 "php": 1779293208946.7368,
 "pkr": 9405448899314.492,
 "pln": 131004026275.63239,
 "rub": 2949145928900.2744,
 "sar": 122352938594.8291,
 "sek": 339081174468.4453,
 "sgd": 43339499246.63701,
 "thb": 1123204271365.786,
 "try": 878471700942.7214,
 "twd": 1021668824231.7206,
 "uah": 1206633972389.2056,
 "vef": 3267473669.1416736,
 "vnd": 772271181992130.1,
 "zar": 573959993253.0933,
 "xdr": 24276908404.863293,
 "xag": 1323584631.2883685,
 "xau": 16621269.483444704,
 "bits": 1114672772534.9583,
 "sats": 111467277253495.83
 },
 "market_cap_percentage": {
 "btc": 46.4860691227917,
 "eth": 18.289546692378778,
 "usdt": 6.845354861397698,
 "bnb": 3.0318994350518773,
 "xrp": 3.0213497675688017,
 "usdc": 2.172667475586101,
 "steth": 1.1918562160503663,
 "doge": 0.952035814530181,
 "ada": 0.8732831714668278,
 "sol": 0.7717444187643496
 },
 "market_cap_change_percentage_24h_usd": 1.1432576438399944,
 "updated_at": 1690309805
 }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        guard let value = totalMarketCap["usd"] else {return ""}
        return "$\(value.formattedWithAbbreviations())"
    }
    
    var volume: String {
        guard let value = totalMarketCap["usd"] else {return ""}
        return "$\(value.formattedWithAbbreviations())"
    }
    
    var btcDominance: String {
        guard let value = marketCapPercentage["btc"] else {return ""}
        return value.asPercentString()
    }
}
