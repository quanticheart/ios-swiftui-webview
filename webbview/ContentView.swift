//
//  ContentView.swift
//  webbview
//
//  Created by Jonn Alves on 10/03/23.
//

import SwiftUI
import SwiftUIWebView

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            LoadingView(status: viewModel.state.isLoading)
            VStack {
                titleView
                navigationToolbar
                errorView
                Divider()
                WebView(action: $viewModel.action, state: $viewModel.state, restrictedPages: ["apple.com"])
                Spacer()
            }
        }
    }
    
    private var titleView: some View {
        Text(String(format: "%@ - %@", viewModel.state.pageTitle ?? "Load a page", viewModel.state.pageURL ?? "No URL"))
            .font(.system(size: 12))
            .lineLimit(1)
    }
    
    private var navigationToolbar: some View {
        
        HStack(spacing: 10) {
            TextField("Address", text: $viewModel.address)
            if viewModel.state.isLoading {
                if #available(iOS 14, macOS 10.15, *) {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    Text("Loading")
                }
            }
            Spacer()
            Button("Go") {
                if let url = URL(string: viewModel.address) {
                    viewModel.action = .load(URLRequest(url: url))
                }
            }
            Button(action: {
                viewModel.action = .reload
            }) {
                Image(systemName: "arrow.counterclockwise")
                    .imageScale(.large)
            }
            
                Button(action: {
                    viewModel.action = .goBack
                }) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                }.disabled(!viewModel.state.canGoBack)
            
           
                Button(action: {
                    viewModel.action = .goForward
                }) {
                    Image(systemName: "chevron.right")
                        .imageScale(.large)
                    
                }.disabled(!viewModel.state.canGoForward)
            
        }.padding()
        
    }
    
    private var errorView: some View {
        Group {
            if let error = viewModel.state.error {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

