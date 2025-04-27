//
//  ButtonStyle+Extension.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

extension ButtonStyle where Self == RSDownloadButtonStyle {
    static func download(
        _ state: RSDownloadButtonStyle.ButtonState
    ) -> RSDownloadButtonStyle {
        RSDownloadButtonStyle(state: state)
    }
}
