//
//  RotateVerticalImage.swift
//  RecapStore
//
//  Created by 김도형 on 4/26/25.
//

import SwiftUI

extension View where Self == Image {
    func rotateVertical() -> Image {
        let uiImage = ImageRenderer(content: self).uiImage
        guard let uiImage else { return self }
        let width = uiImage.size.width
        let height = uiImage.size.height
        
        guard width > height else { return self }
        
        let size = CGSize(width: height, height: width)
        
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return self
        }
        
        context.translateBy(x: width / 2, y: height / 2)
        context.rotate(by: .pi / 2)
        
        uiImage.draw(in: CGRect(
            x: -(width / 2),
            y: -(height / 2),
            width: width,
            height: height
        ))
        
        let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let rotatedImage else { return self }
        
        return Image(uiImage: rotatedImage)
    }
}
