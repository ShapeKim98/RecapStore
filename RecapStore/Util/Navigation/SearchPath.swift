//
//  SearchPath.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

enum SearchPath: Sendable {
    case appDetail
}

extension EnvironmentValues {
    var searchNavigation: Navigation<SearchPath> {
        get { self[Navigation<SearchPath>.self] }
        set { self[Navigation<SearchPath>.self] = newValue }
    }
}
