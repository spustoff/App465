//
//  SettingsView.swift
//  App465
//
//  Created by IGOR on 09/04/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Settings")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                    
                }
                .padding(.top)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        VStack(spacing: 12) {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Rate app")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    })
                    
                    Button(action: {
                        
                        guard let url = URL(string: DataManager().usagePolicy) else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        VStack(spacing: 12) {
                            
                            Image(systemName: "menucard.fill")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 16, weight: .regular))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
