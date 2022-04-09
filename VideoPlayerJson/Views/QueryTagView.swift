//
//  QueryTagView.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 09/04/2022.
//

import SwiftUI

struct QueryTagView: View {
    
    var query: Query
    var isSelected: Bool
    
    var body: some View {
        Text(query.rawValue.capitalized)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .primary : .gray)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
    }
}










struct QueryTagView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QueryTagView(query: .animals, isSelected: true)
                .previewLayout(.sizeThatFits)
            QueryTagView(query: .food, isSelected: true)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        .padding()
    }
}
