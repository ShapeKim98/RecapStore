//
//  Responsable.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import Foundation

struct Responsable<T: Decodable & Sendable>: Decodable, Sendable {
    let results: T
}
