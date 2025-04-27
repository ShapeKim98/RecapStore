//
//  Responsable.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation

struct SearchDTO<T: Decodable>: Decodable {
    let results: T
}
