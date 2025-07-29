//
//  CustomListRowView.swift
//  HikeApp
//
//  Created by Thiago Alves on 28/07/25.
//

import SwiftUI

struct CustomListRowView: View {
	//MARK: PROPERTIES
	@State var rowLabel: String
	@State var rowIcon: String
	@State var rowContent: String? = nil
	@State var rowTintColor: Color
	@State var rowLinkLabel: String? = nil
	@State var rowLinkDestination: String? = nil
	var body: some View {
		LabeledContent {
			if rowContent != nil {
				Text(rowContent!)
					.foregroundColor(.primary)
					.fontWeight(.semibold)
			} else if (rowLinkLabel != nil && rowLinkDestination != nil){
				Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
					.foregroundColor(.pink)
					.fontWeight(.semibold)
				
			} else {
				/*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
			}
		} label: {
			HStack {
				ZStack() {
					RoundedRectangle(cornerRadius: 8)
						.frame(width: 30, height: 30)
						.foregroundColor(rowTintColor)
					Image(systemName: rowIcon)
						.foregroundColor(.white)
						.fontWeight(.semibold)
				}
				Text(rowLabel)
			}
		}
	}
}
	
	#Preview {
		List(0 ..< 1) { item in
			CustomListRowView(rowLabel: "Website",
							  rowIcon: "globe",
							  rowContent: nil,
							  rowTintColor: .pink,
							  rowLinkLabel: "Portfolio | Thiago Alves",
							  rowLinkDestination:"https://github.com/tigos88/",
			)
		}
	}

