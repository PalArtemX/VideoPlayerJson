//
//  HomeView.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 09/04/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var videoManagerVM: VideoManagerViewModel
    let columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            VStack {
                // MARK: - Query Tag
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Query.allCases, id: \.self) { query in
                            QueryTagView(query: query, isSelected: videoManagerVM.selectedQuery == query)
                                .onTapGesture {
                                    videoManagerVM.selectedQuery = query
                                }
                        }
                    }
                    .padding()
                }
                
                // MARK: - Videos
                ScrollView {
                    if videoManagerVM.videos.isEmpty {
                        ProgressView()
                    } else {
                        LazyVGrid(columns: columns) {
                            ForEach(videoManagerVM.videos, id: \.id) { video in
                                NavigationLink {
                                    VideoView(video: video)
                                } label: {
                                    VideoCardView(video: video)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .background(Color.accentColor)
            .navigationBarHidden(true)
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(VideoManagerViewModel())
    }
}
