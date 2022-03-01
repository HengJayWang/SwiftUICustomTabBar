//
//  CustomTabBarView.swift
//  SwiftUICustomTabBar
//
//  Created by M200_Macbook_Pro on 2022/2/24.
//

import SwiftUI

struct CustomTabBarView: View {
    
    @State var selectedTabIndex = 0
    @State var showFullScreenCover = false
    
    let tabImages = ["person", "gear", "plus.circle.fill", "pencil", "lasso"]
    
    init() {
        // TabBar bacground is tarnsparent in iOS 15
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                
                Spacer()
                    .fullScreenCover(isPresented: $showFullScreenCover) {
                        
                    } content: {
                        NavigationView {
                            ZStack {
                                Color.pink.ignoresSafeArea()
                                Text("Fullscreen Cover")
                            }
                            .toolbar { Button("Dismiss", action: { showFullScreenCover = false } ) }
                        }
                        .navigationTitle("Fullscreen Cover")
                        
                    }

                
                switch selectedTabIndex {
                case 0:
                    NavigationView {
                        ZStack {
                            
                            Text("First View")
                        }
                        .navigationTitle("First Tab")
                    }
                case 1:
                    ScrollView {
                        Text("Second View")
                    }
                default:
                    NavigationView {
                        Text("Remaining View")
                    }
                }
            }
            
            Divider()
                .background(Color(.secondarySystemBackground))
            
            HStack {
                ForEach(0..<5) { index in
                    Spacer()
                    
                    Button {
                        selectedTabIndex = index
                    } label: {
                        if index == 2 {
                            Rectangle().frame(width: 0).foregroundColor(Color(.systemBackground))
                        } else {
                            Image(systemName: tabImages[index])
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(selectedTabIndex == index ? .blue : .init(white: 0.8))
                        }
                    }

                    Spacer()
                }
            }
            .frame(height: UIScreen.main.bounds.height / 10)
            .frame(maxWidth: .infinity)
            .background(Color(.secondarySystemBackground))
            .overlay{
                Button {
                    showFullScreenCover = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 72, weight: .bold))
                        .foregroundColor(.red)
                        .offset(y: -36)
                }
            }
        }
        .ignoresSafeArea()
    }
}

// Original TabView

//TabView {
//    Text("First")
//        .tabItem {
//            Label("First", systemImage: "person")
//        }
//
//    Text("Second")
//        .tabItem {
//            Label("Second", systemImage: "gear")
//        }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarView()
    }
}
