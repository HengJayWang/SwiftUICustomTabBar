//
//  PopUpMenu.swift
//  SwiftUICustomTabBar
//
//  Created by M100-M1MacMini on 2022/3/1.
//

import SwiftUI

struct PopUpMenu: View {
    var body: some View {
        HStack(spacing: 24) {
            Spacer()
            ForEach(MenuViewModel.allCases, id: \.self) { item in
                MenuItem(viewModel: item)
            }
            Spacer()
        }
        .transition(.scale)
    }
}

enum MenuViewModel: Int, CaseIterable {
    case share, save, add, download
    
    var imageName: String {
        switch self {
        case .share:    return "paperplane.fill"
        case .save:     return "bookmark.fill"
        case .add:      return "plus.rectangle.fill.on.rectangle.fill"
        case .download: return "square.and.arrow.down.fill"
        }
    }
    
    var title: String {
        switch self {
        case .share:    return "Share"
        case .save:     return "Save"
        case .add:      return "Add"
        case .download: return "Download"
        }
    }
}

struct MenuItem: View {
    let viewModel: MenuViewModel
    let dimension: CGFloat = 48
    
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ZStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: dimension, height: dimension)
                    .shadow(color: .secondary.opacity(0.8) ,radius: 8)
                
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(12)
                    .frame(width: dimension, height: dimension)
                    .foregroundColor(.white)
            }
            
            Text(viewModel.title)
                .font(.footnote)
        }
    }
}

struct PopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        PopUpMenu()
    }
}
