//
//  CardView.swift
//  HikeApp
//
//  Created by Thiago Alves on 27/06/25.
//

import SwiftUI

struct CardView: View {
	
	//MARK: PROPERTIES
	
	@State private var imageNumber: Int = 1
	@State private var randomNumber: Int = 1
	@State private var isShowingSheet: Bool = false
	
	//MARK: MTLFunctionStitchingNode
	
	func randomImage(){
		print("---Button Pressed---")
		print("Status: Old image number = \(imageNumber)")
		repeat{
			randomNumber = Int.random(in: 1...5)
			print("Action: Random Number Generated = \(randomNumber)")
		} while randomNumber == imageNumber
		
		imageNumber = randomNumber
		print("Result: New Image Number = \(imageNumber)")
		print("---The End---")
		print("\n")
	}
	
	var body: some View {
		
		//MARK: - CARD
		
		ZStack {
			CustomBackgroundView()
			VStack {
				//MARK: - HEADER
				
				VStack(alignment: .leading) {
					HStack {
						Text("Hiking")
							.fontWeight(.black)
							.font(.system(size: 52))
							.foregroundStyle(
								LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
						Spacer()
						
						Button{
							//ACTION:Show a Sheet
							print("The button was pressed")
							isShowingSheet.toggle( )
						} label: {
							CustonButtonView()
								
						}
						.sheet(isPresented: $isShowingSheet){
							SettingsView()
								.presentationDragIndicator(.visible)
								.presentationDetents([.medium, .large])
						}}
					Text("Fun and enjoyable outdoor activities for friends and families")
						.multilineTextAlignment(.leading)
						.italic(true)
						.foregroundColor(.customGrayMedium)
				}//MARK: - END HEADER
				.padding(.horizontal, 30)
					
				
				//MARK: - MAIN CONTENT
				ZStack {
					CustomCircleView()
					
					Image("image-\(imageNumber)")
						.resizable()
						.scaledToFit( )
						.animation(.default, value: imageNumber)
				}
				
				//MARK: - FOOTER
				Button {
					//ACTION:
					print("The button was pressed")
					randomImage()
				} label: {
					Text("Get Started")
						.font(.title2)
						.fontWeight(.heavy)
						.foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
						.shadow(color: .black.opacity(0.25), radius: 0.25,x:1,y:2)
						
						
						
				}
				.buttonStyle(GradientButton())
					

			}//MARK: - ZSTACK
		}//: CARD
		.frame(width: 320, height: 570)
	}
}

#Preview {
	CardView()
}
