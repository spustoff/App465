//
//  AcquiringView.swift
//  App465
//
//  Created by IGOR on 09/04/2024.
//

import SwiftUI

struct AcquiringView: View {
    
    @StateObject var viewModel = AqcuiringViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    VStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAssTB = true
                            }
                            
                        }, label: {
                            
                            VStack {
                                
                                Text("$\(viewModel.TB)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 22, weight: .semibold))
                                
                                Text("Total amount of earnings")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        })
                           
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isCurr = true
                            }
                            
                        }, label: {
                            
                            VStack {
                                
                                HStack {
                                    
                                    Image("flags")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 34)
                                    
                                    Text("EUR/USD")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                    
                                }
                                
                                Text("Сurrency of earnings")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        })
                    }
                    
                    VStack {
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAssTA = true
                            }
                            
                        }, label: {
                            
                            VStack {
                                
                                Text("\(viewModel.TotalAcquisitions)")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 22, weight: .semibold))
                                
                                Text("Quantity of acquisitions")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        })
                           
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAssTR = true
                            }
                            
                        }, label: {
                            
                            VStack {
                                
                                Text("\(viewModel.TotalRecieved)%")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 22, weight: .semibold))
                                
                                Text("Received %")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .regular))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        })
                    }
                }
                .padding(.top)
                
                HStack {
                    
                    Text("Acquiring")
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
                            
                            Text("Add")
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                        }
                        .frame(width: 100, height: 40)
                        .background(RoundedRectangle(cornerRadius: 5).fill(Color("prim")))
                    })
                }
                .padding(.vertical, 9)
                
                if viewModel.acquirings.isEmpty {
                    
                    VStack {
                        
                        Image("Check")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        
                        Text("Track the earnings of your acquirers")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                     
                            ForEach(viewModel.acquirings, id: \.self) { index in
                                
                                VStack(alignment: .leading) {
                                    
                                    Text("Address")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12, weight: .regular))
                                    
                                    Text(index.acAddress ?? "")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 15, weight: .regular))
                                    
                                    HStack {
                                        
                                        Text("Income")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .regular))
                                     
                                        Text("$\(index.acIncome ?? "")")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 15, weight: .semibold))
                                    }
                                    
                                    Spacer()
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .frame(height: 120)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                                .overlay (
                                    
                                    VStack {
                                        
                                        Spacer()
                                        
                                        HStack {
                                            
                                            Image("ugcheck")
                                            
                                            Spacer()
                                        }
                                    }
                                )
                            }
                        })
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchAcquirings()
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAssTB ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAssTB = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAssTB = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Total amount of earnings")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter amount")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.tb.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.tb)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    
                    Button(action: {
        
                        viewModel.TB = viewModel.tb
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAssTB = false

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
                            
                            viewModel.isAssTB = false
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
                .offset(y: viewModel.isAssTB ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAssTA ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAssTA = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAssTA = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Quantity of acquisitions")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter quantity")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.acquisitions.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.acquisitions)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    
                    Button(action: {
        
                        viewModel.TotalAcquisitions = Int(viewModel.acquisitions) ?? 0
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAssTA = false

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
                            
                            viewModel.isAssTA = false
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
                .offset(y: viewModel.isAssTA ? 0 : UIScreen.main.bounds.height)
            }
        )
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isAssTR ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAssTR = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAssTR = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Received %")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter %")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.recieved.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.recieved)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                    
                    Button(action: {
        
                        viewModel.TotalRecieved = Int(viewModel.recieved) ?? 0
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAssTR = false

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
                            
                            viewModel.isAssTR = false
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
                .offset(y: viewModel.isAssTR ? 0 : UIScreen.main.bounds.height)
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
                        
                        Text("New acquiring")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                            .padding()
                        
                    }
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter address")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.acAddress.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.acAddress)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))

                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter income")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .opacity(viewModel.acIncome.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.acIncome)
                            .foregroundColor(Color.black)
                            .font(.system(size: 14, weight: .regular))
                        
                    })
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color("prim")))

                    Button(action: {
                                                
                        viewModel.addsubAcquiring()
                        
                        viewModel.acAddress = ""
                        viewModel.acIncome = ""
                        
                        viewModel.fetchAcquirings()
                        
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
                    .disabled(viewModel.acAddress.isEmpty || viewModel.acIncome.isEmpty ? true : false)
                    .opacity(viewModel.acAddress.isEmpty || viewModel.acIncome.isEmpty ? 0.5 : 1)
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
        .sheet(isPresented: $viewModel.isCurr, content: {
            
            CurrenciesView(viewModel: viewModel)
        })
    }
}

#Preview {
    AcquiringView()
}
