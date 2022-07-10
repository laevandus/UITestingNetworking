//
//  ContentView.swift
//  UITestingNetworking
//
//  Created by Toomas Vahter on 14.05.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.loadedDataString)
            Button("Load Data", action: { viewModel.loadData() })
        }
        .padding()
    }
}

extension ContentView {
    @MainActor final class ViewModel: ObservableObject {
        @Published var loadedDataString = "Tap"
        
        func loadData() {
            Task {
                let url = URL(string: "https://augmentedcode.io/api/example")!
                let request = URLRequest(url: url)
                do {
                    let response = try await URLSession.shared.data(for: request)
                    loadedDataString = String(decoding: response.0, as: UTF8.self)
                }
                catch {
                    loadedDataString = "Failed"
                }
            }
        }
    }
}

extension URLSession {
    static var main: URLSession = .shared
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
