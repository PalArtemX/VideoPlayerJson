//
//  HomeView.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 09/04/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Query.allCases, id: \.self) { query in
                        QueryTagView(query: query, isSelected: false)
                    }
                }
                .padding()
            }
            
            ScrollView {
                VideoCardView(video: previewVideo)
            }
            .frame(maxWidth: .infinity)
        }
        .background(Color.accentColor)
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
