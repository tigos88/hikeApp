//
//  CustonButtonView.swift
//  HikeApp
//
//  Created by Thiago Alves on 10/07/25.
//

import SwiftUI

struct CustonButtonView: View {
    var body: some View {
		ZStack{
			Circle()
				.fill(LinearGradient(colors: [
					.white,
						.customGreenLight,
						.customGreenMedium],
									 startPoint: .top,
									 endPoint: .bottom))
				Circle()
				.stroke(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom),lineWidth: 4)
				Image(systemName: "figure.hiking")
				.fontWeight(.bold)
				.font(.system(size: 30))
				.foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
		}
		.frame(width: 58, height: 58)
    }
}

#Preview (traits: .sizeThatFitsLayout){
    CustonButtonView()
		.padding()
}
