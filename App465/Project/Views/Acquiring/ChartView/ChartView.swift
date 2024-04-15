//
//  ChartView.swift
//  App465
//
//  Created by IGOR on 10/04/2024.
//

import SwiftUI

struct ChartView: View {

    @StateObject var viewModel: AqcuiringViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("\(viewModel.currentCurrency.isEmpty ? viewModel.cC : viewModel.cC)")
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .semibold))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom)
                
                HStack {
                                    
                    HStack {
                        
                        Text("\(viewModel.currentCurrency.isEmpty ? viewModel.cC : viewModel.cC)")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        
                        Text("+\(String(format: "%.f", Double(.random(in: 0...2)))).\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))%")
                            .foregroundColor(.green)
                            .font(.system(size: 13, weight: .semibold))

                }
                .padding()
                .frame(height: 55)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    Spacer()
                
                    
                    Text("$\(String(format: "%.f", Double(.random(in: 1...9))))\(String(format: "%.f", Double(.random(in: 1...3))))\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9)))),\(String(format: "%.f", Double(.random(in: 0...9))))\(String(format: "%.f", Double(.random(in: 0...9))))")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                }
                
                Image("Graph")
                    .resizable()
                
                HStack {
                    
                    HStack {

                        Button(action: {
                                                        
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.red))
                        })
                        
                        Button(action: {
                                                        
                            viewModel.isChart = false
                            viewModel.isCurr = false
                            
                        }, label: {
                            
                            Text("Apply")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 12).fill(.green))
                        })
                    }
                    .padding(.vertical)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ChartView(viewModel: AqcuiringViewModel())
}
