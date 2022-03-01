//
//  TabBarWithPopUpMenu.swift
//  SwiftUICustomTabBar
//
//  Created by M100-M1MacMini on 2022/3/1.
//

import SwiftUI

struct TabBarWithPopUpMenu: View {
    
    @State private var showMenu = false
    @StateObject var router = ViewRouter()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer()
                
                router.view
                
                Spacer()
                
                Divider()
                    .background(Color(.secondarySystemBackground))
                
                HStack {
                    TabIcon(viewModel: .home, router: router)
                    TabIcon(viewModel: .search, router: router)
                    
                    TabAddIcon(showMenu: $showMenu)
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                    
                    TabIcon(viewModel: .notifications, router: router)
                    TabIcon(viewModel: .account, router: router)
                }
                .frame(height: UIScreen.main.bounds.height / 10)
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
            }
            
            if showMenu {
                PopUpMenu().padding(.bottom, 144)
            }
        }
        .ignoresSafeArea()
    }
}

struct TabIcon: View {
    
    let viewModel: TabBarViewModel
    @ObservedObject var router: ViewRouter
    
    var body: some View {
        Button {
            router.currentItem = viewModel
        } label: {
            Image(systemName: viewModel.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .frame(maxWidth: .infinity)
                .foregroundColor(.init(white: 0.8))
        }
    }
}

struct TabAddIcon: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: 56, height: 56)
                .shadow(color: .secondary.opacity(0.8) ,radius: 8)
            
            Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .frame(maxWidth: .infinity)
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: showMenu ? 135 : 0))
        }
        .offset(y: -44)
    }
}

struct TabBarWithPopUpMenu_Previews: PreviewProvider {
    static var previews: some View {
        TabBarWithPopUpMenu()
    }
}


