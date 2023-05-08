//
//  MenuAdminView.swift
//  RestaurantIOS
//
//  Created by Evgeniy Sergeev on 18.04.2023.
//

import SwiftUI

struct MenuAdminView: View {
    @State var showProductView = false
    @Binding var user: User?
//    @State var user: User?

    var body: some View {
        List {
            ForEach(defProducts){ product in
                AdminProductCell(product: product)
                    .listRowSeparator(.hidden)
                    .swipeActions(edge: .trailing,allowsFullSwipe: true){
                        Button {
                            print("Delete")
                        } label: {
                            Image(systemName: "trash")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true){
                        Button {
                            print("Edit")
                        } label: {
                            Image(systemName: "square.and.pencil" )
                        }
                        .tint(.green)
                    }
            }
            
        }.listStyle(.plain)
            .navigationTitle("Menu")
            .overlay(alignment: .bottomTrailing){
                Button {
                    showProductView.toggle()
                } label: {
                    Image (systemName: "plus")
//                        .padding()
                        .frame(width: 60, height: 60)
                        .background(.brown)
                        .clipShape(Circle())
                        .padding()
                        .foregroundColor(.white)
                       
                }
                }
            .sheet(isPresented: $showProductView) {
                AdminProductView()
            }
        
       
            .onAppear{
            print(user?.login ?? "Пользователь не найден")
                }
            }
    }



//struct MenuAdminView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuAdminView()
//    }
//}

let defProducts = [Product(id:UUID().uuidString,
                           title:"Шашлык из свиной шейки",
                           price:400,
                           description:"Подается с соусом, маринованным луком и лепешкой"),
                   Product(id:UUID().uuidString,
                           title:"Шаурма с курицей",
                           price:170,
                           description:"Классика жанра на быстро пожевать, завернута в лаваш"),
                   Product(id:UUID().uuidString,
                           title:"Лагман",
                           price:370,
                           description:"Сытный восточный суп с говядиной и домашней лапшой"),
                   Product(id:UUID().uuidString,
                           title:"Лепешка",
                           price:40,
                           description:"Просто кавказская лепшка")
]
