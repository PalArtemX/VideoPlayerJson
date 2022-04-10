//
//  VideoManager.swift
//  VideoPlayerJson
//
//  Created by Artem Paliutin on 09/04/2022.
//

import Foundation
import Combine

// key API: 563492ad6f91700001000001655fed9f7c154cf4ae425cd2799e94ef

class VideoManager: ObservableObject {
    
    @Published var videos: [Video] = []
    @Published var selectedQuery = Query.nature {
        didSet {
            Task.init {
                await findVideos(topic: selectedQuery)
            }
        }
    }
    var cancellable = Set<AnyCancellable>()
    
    init() {
        Task.init {
            await findVideos(topic: selectedQuery)
        }
    }
    
    // MARK: - Functions
    
    // MARK: findVideos
    func findVideos(topic: Query) async {
        
            guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&per_page=10&orienttion=portrait") else { return }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.setValue("563492ad6f91700001000001655fed9f7c154cf4ae425cd2799e94ef", forHTTPHeaderField: "Authorization")
            
            URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap { (output) -> Data in
                    guard
                        let response = output.response as? HTTPURLResponse,
                        response.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                    return output.data
                }
                .decode(type: ResponseBody.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
                .sink { completion in
                    switch completion {
                    case .finished:
                        print("completion finish")
                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                    }
                    
                } receiveValue: { [weak self] returnedResponseBody in
                    self?.videos = []
                    self?.videos = returnedResponseBody.videos
                }
                .store(in: &cancellable)

    }
    
}

