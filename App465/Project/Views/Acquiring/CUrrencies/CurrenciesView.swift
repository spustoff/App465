//
//  CurrenciesView.swift
//  App465
//
//  Created by IGOR on 10/04/2024.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel: AqcuiringViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit currency")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))

                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding()
                
                HStack {
                    
                    Image("flags")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                    
                    Text(viewModel.currentCurrency.isEmpty ? viewModel.cC : viewModel.currentCurrency)
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                .padding(.horizontal)
                .padding(.bottom)
                
                Text("Currency pairs")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.cC = index
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isChart = true
                                }
                                
                            }, label: {
  
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
  
                            })
                            .padding()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        }
                    })
                }
                .padding()
            }
        }
                .sheet(isPresented: $viewModel.isChart, content: {
        
                    ChartView(viewModel: viewModel)
                })
    }
}

#Preview {
    CurrenciesView(viewModel: AqcuiringViewModel())
}
