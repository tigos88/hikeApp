//
//  SettingsView.swift
//  HikeApp
//
//  Created by Thiago Alves on 23/07/25.
//

import SwiftUI

struct SettingsView: View {
	//MARK: PROPERTIES
	
	private let alternateAppIcons: [String] = [
		"AppIcon-Backpack", "AppIcon-Camera", "AppIcon-Campfire","AppIcon-MagnifyingGlass","AppIcon-Map", "AppIcon-Mushroom"
	]
		
    var body: some View {
		List{
			//MARK: - SECTION: HEADER
			Section{
				HStack {
					Spacer()
					Image(systemName: "laurel.leading")
						.font(.system(size: 80, weight: .black))
					
					VStack (spacing: -8) {
						Text("HIKE")
							.font(.system(size: 66, weight: .black))
						Text("Editor's Choice")
							.fontWeight(.medium)
					}
					Image(systemName: "laurel.trailing")
						.font(.system(size: 80, weight: .black))
					Spacer()
				}
				.foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium,.customGreenDark], startPoint: .top, endPoint: .bottom))
				.padding(.top, 8)
				VStack(spacing: 8){
					Text("Where can you find \nperfect tracks?")
						.font(.title2)
						.fontWeight(.heavy)
					
					Text("The hike which you want to explore.\nThe place which you want to visit.\nThe adventure which you want to live.\n\nFind them all here.")
						.font(.footnote)
						.italic()
					
					Text("Dust off the boots! It's time for a walk.")
						.fontWeight(.heavy)
						.foregroundColor(.customGreenMedium)
					
				}.multilineTextAlignment(.center)
					.padding(.bottom, 16)
					.frame(maxWidth: .infinity)
			}.listRowSeparator(Visibility.hidden)
				
			//MARK: - SECTION: ICONS
			Section (header: Text("Alternate Icons")){
				ScrollView(.horizontal, showsIndicators: false){
					HStack(spacing: 12) {
						ForEach(alternateAppIcons.indices, id: \.self) { item in
							Button{
								print("Icon \(alternateAppIcons[item]) was pressed")
								UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){
									error in
									if error != nil {
										print("Error setting alternate icon: \(String(describing: error?.localizedDescription))")
									}else{
										print("Succes! You ahve chagened your icon")
									}}
							}label: {
								Image("\(alternateAppIcons[item])-Preview")
									.resizable()
									.scaledToFit( )
									.frame(width: 80, height: 80)
									.cornerRadius(16)
							}
							.buttonStyle(.borderless)
						}
					}
				}//: SCROLL VIEW
				.padding(.top, 12)
				Text("Choose your best App Icon")
					.frame(minWidth: 0, maxWidth: .infinity)
					.multilineTextAlignment(.center)
					.foregroundColor(.secondary)
					.font(.footnote)
					.padding(.bottom, 12)
			}//: SECTION
			.listRowSeparator(.hidden)
			
			//MARK: - SECTION: ABOUT
			Section(
				header: Text("About app:"),
				
				footer: HStack {
					Spacer()
					Text("Copyright © All rights reserved.Tigos")
					Spacer()
						
				}.padding(.vertical, 8)
			)
			{
				//1 Basic Labeled content
				//LabeledContent("Application", value: "Hike")
				
				//2 Label Content
				CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
				CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "Ios, IpadOs", rowTintColor: .red)
				
				CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SwiftUI", rowTintColor: .orange)
				
				CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
				
				CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Thiago Alves", rowTintColor: .black)
								
				CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Portfólio | Thiago", rowLinkDestination: "https://github.com/tigos88/")
			}//: SECTION
		}
    }
}

#Preview {
    SettingsView()
}
