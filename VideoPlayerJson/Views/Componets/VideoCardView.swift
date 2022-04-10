//
//  VideoCardView.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 09/04/2022.
//

import SwiftUI

struct VideoCardView: View {
    
    var video: Video
    
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: video.image)) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160, height: 250)
                        .cornerRadius(15)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 160, height: 250)
                        .cornerRadius(15)
                }
                
                VStack(alignment: .leading) {
                    Text("\(video.duration) sec")
                        .bold()
                    Text("By \(video.user.name)")
                        .bold()
                        .multilineTextAlignment(.leading)
                }
                .font(.caption)
                .padding()
                
            }
            
            Image(systemName: "play.fill")
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
        }
    }
}










struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VideoCardView(video: previewVideo)
                .previewLayout(.sizeThatFits)
            VideoCardView(video: previewVideo)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
