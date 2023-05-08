//
//  AuthView.swift
//  RestaurantIOS
//
//  Created by Evgeniy Sergeev on 16.04.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State var descNumber: String = ""
    @State var showEmployeeSignIn = false
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 150)
                .foregroundColor(Color("brown"))
                .opacity(0.2)
            Spacer()
        }.ignoresSafeArea()
            .background(Image("bg")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode:.fill)
            )
            .overlay {
                VStack(spacing: 14){
                    TextField("Введите номер столика", text: $descNumber)
                        .padding()
                        .background(.white)
                    
                        .font(.title3).bold()
                    Spacer()
                        .frame(height: 0)
                    Button {
                        print("Вход")} label: {
                            Text("В меню")
                        }.frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("brown"))
                        .foregroundColor(.white)
                    //                        .padding()
                        .font(.title3).bold()
                    Spacer()
                        .frame(height:200)
                    
                }.padding(.horizontal, 60)
                
            }
            .overlay(alignment: .bottomLeading){
                Button {showEmployeeSignIn.toggle()
                } label: {
                    Text("Вход для\n сотрудника")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(.leading)
                }
            }
            .sheet(isPresented: $showEmployeeSignIn){EmployeeSigninView()}
        }
    }
    
        struct AuthView_Previews: PreviewProvider {
            static var previews: some View {
                AuthView()
            }
        }
