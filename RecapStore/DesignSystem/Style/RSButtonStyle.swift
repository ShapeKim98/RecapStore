//
//  RSButtonStyle.swift
//  RecapStore
//
//  Created by 김도형 on 4/27/25.
//

import SwiftUI

struct RSDownloadButtonStyle: ButtonStyle {
    private let state: ButtonState
    
    init(state: ButtonState) {
        self.state = state
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        Group {
            switch state {
            case .default:
                configuration.label
                    .foregroundStyle(.blue)
                    .padding(.vertical, 8)
            case .progress(let progress):
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.blue, lineWidth: 2)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 28, height: 28)
                    .background {
                        Circle().stroke(.secondary.opacity(0.3), lineWidth: 2)
                    }
                    .padding()
                    .overlay {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                            .foregroundStyle(.blue)
                    }
                    .animation(.default, value: progress)
            case .resume:
                HStack(spacing: 6) {
                    Image(systemName: "icloud.and.arrow.down")
                        .font(.footnote)
                    
                    configuration.label
                        .font(.footnote)
                }
                .foregroundStyle(.blue)
                .padding(.vertical, 8)
            case .again:
                Image(systemName: "icloud.and.arrow.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundStyle(.blue)
            }
        }
        .font(.subheadline)
        .fontWeight(.bold)
        .frame(width: 80)
        .background {
            if state == .default || state == .resume {
                RoundedRectangle(cornerRadius: 9999, style: .continuous)
                    .fill(.secondary.opacity(0.2))
            }
        }
        .scaleEffect(configuration.isPressed ? 0.9 : 1)
        .animation(.easeInOut, value: configuration.isPressed)
    }
}

extension RSDownloadButtonStyle {
    enum ButtonState: Equatable {
        case `default`
        case progress(CGFloat)
        case resume
        case again
    }
}

#Preview {
    VStack(spacing: 20) {
        Button("받기") {
            
        }
        .buttonStyle(.download(.default))
        
        Button("열기") {
            
        }
        .buttonStyle(.download(.default))
        
        Button("다운중") {
            
        }
        .buttonStyle(.download(.progress(0.1)))
        
        Button("재개") {
            
        }
        .buttonStyle(.download(.resume))
        
        Button("다시받기") {
            
        }
        .buttonStyle(.download(.again))
    }
}
