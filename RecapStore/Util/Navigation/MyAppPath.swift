//
//  MyAppPath.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

enum MyAppPath: Sendable {
    case appDetail
}

extension EnvironmentValues {
    var myAppNavigation: Navigation<MyAppPath> {
        get { self[Navigation<MyAppPath>.self] }
        set { self[Navigation<MyAppPath>.self] = newValue }
    }
}
