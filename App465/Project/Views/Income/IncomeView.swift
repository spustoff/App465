//
//  IncomeView.swift
//  App465
//
//  Created by IGOR on 09/04/2024.
//

import SwiftUI

struct IncomeView: View {
    
    @StateObject var viewModel = IncomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Income")
                        .foregroundColor(.black)
                        .font(.system(size: 26, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text("ADD")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                        }
                        .frame(width: 100, height: 40)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                    })
                }
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAMI = true
                    }
                    
                }, label: {
                    
                    VStack {
                        
                        Text("$\(viewModel.AMI)")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 22, weight: .semibold))
                        
                        Text("Average monthly income")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                })
                .padding(.bottom)
                
                if viewModel.incomes.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Text("Your income")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("Keep a record of your income and record it")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.incomes, id: \.self) { index in
                            
                                HStack {
                                    
                                    Text(index.incName ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Text("$\(index.incAmount ?? "")")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20, weight: .semibold))
                                }
                                .padding()
                                
                                Rectangle()
                                    .fill(.black)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAMI ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAMI = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAMI = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Average monthly income")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.ami.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.ami)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    
                    Button(action: {
        
                        viewModel.AMI = viewModel.ami
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAMI = false

                        }
                                
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAMI = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.blue)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg3")))
                .padding()
                .offset(y: viewModel.isAMI ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAdd ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd  = false
                        }
                    }
                
                VStack {
                    
                    ZStack {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd  = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .font(.system(size: 11, weight: .regular))
                                    .padding(5)
                                    .background(Circle().fill(.white.opacity(0.2)))
                            })
                            
                            Spacer()
                            
                        }
                        
                        Text("New income")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                    }
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter name")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.incName.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.incName)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.incAmount.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.incAmount)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))

                    Button(action: {
                                                
                        viewModel.addIncome()
                        
                        viewModel.incName = ""
                        viewModel.incAmount = ""
                        
                        viewModel.fetchIncomes()
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd  = false
                        }
                        
                    }, label: {
                        
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                        
                    })
                    .disabled(viewModel.incName.isEmpty || viewModel.incAmount.isEmpty ? true : false)
                    .opacity(viewModel.incAmount.isEmpty || viewModel.incName.isEmpty ? 0.5 : 1)
                    .padding(.top, 120)
                    .padding(.bottom, 30)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .bottom)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg3")).ignoresSafeArea())
                .frame(maxHeight: .infinity, alignment: .bottom)
                .offset(y: viewModel.isAdd  ? 0 : UIScreen.main.bounds.height)
            }
        )
        .onAppear {
            
            viewModel.fetchIncomes()
        }
    }
}

#Preview {
    IncomeView()
}
