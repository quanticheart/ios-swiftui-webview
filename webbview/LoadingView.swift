//
//  LoadingView.swift
//  vipertest
//
//  Created by Jonn Alves on 16/02/23.
//

import SwiftUI

struct LoadingView: View {
    var status = true
    
    init(status:Bool){
        self.status = status
    }
    
    var body: some View {
        if(status) {
            if #available(iOS 14, macOS 10.15, *) {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color.white)
                .zIndex(10)
            } else {
                VStack {
                    Text("Loading")
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                .background(Color.white)
                .zIndex(10)
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            LoadingView(status: false)
        }
    }
}
