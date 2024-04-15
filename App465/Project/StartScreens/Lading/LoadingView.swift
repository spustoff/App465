//
//  LoadingView.swift
//  App465
//
//  Created by IGOR on 09/04/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("lobg")
                    .resizable()
                    .ignoresSafeArea()
                                    
                            }
            
            VStack {
                
                Image("llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding(.top, 100)
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 80)
            }
        }
    }
}

#Preview {
    LoadingView()
}
