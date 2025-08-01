//
//  GradientButtonStyle.swift
//  HikeApp
//
//  Created by Thiago Alves on 10/07/25.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration
			.label
			.padding(.vertical)
			.padding(.horizontal, 30)
			.background(
				//Conditional Statement
				//Pressed?
				configuration.isPressed ?
				LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
				:
					LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
					
			)
			.cornerRadius(40)
	}
}
