//
//  ContentViewModel.swift
//  webbview
//
//  Created by Jonn Alves on 10/03/23.
//

import Foundation
import SwiftUI
import Combine
import SwiftUIWebView

class ContentViewModel: ObservableObject{
    
    @Published var action = WebViewAction.idle
    @Published var state = WebViewState.empty
    
    @Published var loading : Bool = false
    @Published var title : String =  ""
    @Published var address = "https://www.google.com"
    
}

extension ContentViewModel {
    func loadList() {
      
    }
}
