//
//  CustomCircleView.swift
//  HikeApp
//
//  Created by Thiago Alves on 18/07/25.
//

import SwiftUI

struct CustomCircleView: View {
	@State private var isAnimateGradient: Bool = false
    var body: some View {
		ZStack {
			
			Circle()
				.fill(
					LinearGradient(colors:								[
						.customIndigoMedium,
						.customSalmonLight],
								   startPoint: isAnimateGradient ? .topLeading: .bottomLeading,
								   endPoint: isAnimateGradient ?  .bottomTrailing: .topLeading))
				.onAppear {
					withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
						isAnimateGradient.toggle()
					}
				}
			MotionAnimationView()
		}
		.frame(width: 256,height: 256)
    }
}

#Preview {
    CustomCircleView()
}
