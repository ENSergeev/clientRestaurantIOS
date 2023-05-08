//
//  EmployeeSigninView.swift
//  RestaurantIOS
//
//  Created by Evgeniy Sergeev on 18.04.2023.
//

import SwiftUI

struct EmployeeSigninView: View {
    @State var login: String = ""
    @State var password: String = ""
    @State var showAdminMenu = false
    @State var user: User?
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
                    Text("Вход для сотрудника")
                        .font(.title2)
                        .foregroundColor(.white)
                    TextField("Логин", text: $login)
                        .padding()
                        .background(.white)
                    
                        .font(.title3).bold()
                    SecureField("Пароль", text: $password)
                        .padding()
                        .background(.white)
                    
                        .font(.title3).bold()
                    Spacer()
                        .frame(height: 0)
                    Button {
                        Task {
                            do {
                                print("начало \(login)")
                                print("начало \(password)")
                                self.user = try await
                                NetworkService.shared.auth(login: login, password: password)
                                print("конец \(login)")
                                print("конец \(password)");
                                self.showAdminMenu.toggle()
                            } catch {print("Обработайте ошибки")}
                        }
                    }label: {
                    Text("Войти!")
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
            .fullScreenCover(isPresented: $showAdminMenu){
               
                MenuAdminView(user: $user)
//                MenuAdminView()
            }
        
        }
    }
    
  

struct EmployeeSigninView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeSigninView()
    }
}
