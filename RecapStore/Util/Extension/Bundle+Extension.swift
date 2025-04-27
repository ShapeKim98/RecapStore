//
//  Bundle+Extension.swift
//  CoinCo
//
//  Created by 김도형 on 3/9/25.
//

import Foundation

extension Bundle {
    var itunesURL: String {
        return infoDictionary?["ITUNES_URL"] as? String ?? ""
    }
}
