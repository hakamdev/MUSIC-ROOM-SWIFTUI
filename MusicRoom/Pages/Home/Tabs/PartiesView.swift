//
//  PartiesView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/17/24.
//

import SwiftUI
import SwiftUIIntrospect

struct PartiesView: View {
    
    @State private var lastHostingView: UIView?
    @State private var showProfile: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Text("Nearby Parties")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(0...10, id: \.self) { x in
                                PartyLargeItemView()
                                    .frame(width: 250, height: 250)
                            }
                        }
                    }
                    .scrollIndicators(.never)
                    
                    Spacer().frame(height: 32)
                    
                    HStack {
                        Text("Nearby Parties")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 16) {
                            ForEach(0...10, id: \.self) { x in
                                VStack {
                                    Spacer()
                                    
                                    HStack(spacing: 16) {
                                        Text("Lfeigta Edition: Listen now and enjoy!")
                                            .font(.body)
                                            .fontWeight(.semibold)
                                            .lineLimit(2, reservesSpace: true)
                                            .foregroundStyle(Color(UIColor.systemBackground))
                                        
                                        Button {
                                            // action
                                        } label: {
                                            Image(systemName: "play.circle.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 42)
                                                .foregroundStyle(Color(UIColor.systemBackground).opacity(0.7))
                                        }

                                    }
                                    .frame(width: 300)
                                    .padding()
                                    .background(.ultraThinMaterial, in: Rectangle())
                                    
                                }
                                .frame(width: 300, height: 300)
                                .background {
                                    Image("art_\(3 - (x % 4))")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                }
                                .background(.green)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }
                    }
                    .scrollIndicators(.never)
                }
                .padding()
            }
            .navigationTitle("Parties")
            .sheet(isPresented: $showProfile) {
                ProfileView()
            }
        }
        .introspect(.navigationView(style: .stack), on: .iOS(.v16, .v17), customize: { navController in
            let bar = navController.navigationBar
            let hosting = UIHostingController (rootView: ProfileIcon {
                self.showProfile = true
            })
            guard let hostingView = hosting.view else { return }
            bar.addSubview(hostingView)
            hostingView.backgroundColor = UIColor.clear
            
            lastHostingView?.removeFromSuperview()
            lastHostingView = hostingView
            
            hostingView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                hostingView.trailingAnchor.constraint(equalTo: bar.trailingAnchor, constant: -16),
                hostingView.bottomAnchor.constraint(equalTo: bar.bottomAnchor, constant: -8)
            ])
        })
    }
}

#Preview {
    PartiesView()
}
