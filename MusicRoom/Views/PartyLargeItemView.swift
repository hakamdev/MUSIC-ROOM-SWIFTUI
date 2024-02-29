//
//  PartyLargeItemView.swift
//  MusicRoom
//
//  Created by Hakam Dev on 2/29/24.
//

import SwiftUI

struct PartyLargeItemView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 0) {
                Text("Lfeigta Edition:")
                    .font(.body)
                    .fontWeight(.semibold)
                    .lineLimit(2, reservesSpace: true)
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button {
                    // action
                } label: {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 42)
                        .foregroundStyle(.white.opacity(0.7))
                }

            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.ultraThinMaterial, in: Rectangle())
            
        }
        //.frame(width: 300, height: 300)
        .background {
            Image("art_1")
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .background(.green)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    PartyLargeItemView()
}
