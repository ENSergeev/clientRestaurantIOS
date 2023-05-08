//
//  AdminProductView.swift
//  RestaurantIOS
//
//  Created by Evgeniy Sergeev on 28.04.2023.
//

import SwiftUI
import PhotosUI


struct AdminProductView: View {
    @State var title: String = ""
    @State var price:Int?
    @State var category: Category = .first
    @State var description: String = ""
    @State var selectedItem: PhotosPickerItem?
    @State var data: Data?
    
    var body: some View {
        VStack() {
            PhotosPicker(selection: $selectedItem) {
                if let data {
                    Image(uiImage: UIImage(data: data)!)
                        .resizable()
                        .frame(width: 240, height: 200)
                        .aspectRatio(contentMode: .fit)
                                    } else {
                    Image (systemName: "camera")
                        .resizable()
                        .frame(width: 240, height: 200)
                        .aspectRatio(contentMode: .fit)
                }
                
            }.onChange(of: selectedItem) { newValue in
                guard let selectedItem else {return}
                selectedItem.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let success):
                        if let success {self.data = success}
                    case .failure(let failure):
                        print("данные не найдены: \(failure)")
                        
                    }
                }
            }

            
            TextField("Название", text:$title)
                .padding().background(.white)
                .padding(.horizontal)
            TextField("Цена", value: $price, format: .number)
                .padding().background(.white)
                .padding(.horizontal)
            Picker("Категория", selection: $category){
                ForEach(Category.allCases, id: \.rawValue){
                    category in
                    Text(category.rawValue)
                        .tag(category)
                }
            }.frame(maxWidth: .infinity)
                .padding(10)
                .background(.white)
                .padding(.horizontal)
                .tint(.black)
            TextField("Описание", text: $description)
                .padding().background(.white)
                .padding(.horizontal)
            Button {
                print ("Создать")
            } label: {
                Text ("Создать")
                    .padding()
                    .frame(maxWidth:.infinity)
                    .background(Color("brown"))
                    .padding()
                    .foregroundColor(.white)
            }

            
        }.frame(maxHeight: .infinity)        .background(Color("lightGray"))
    }
}

struct AdminProductView_Previews: PreviewProvider {
    static var previews: some View {
        AdminProductView()
    }
}

enum Category: String, CaseIterable {
    case first = "Первые блюда"
    case second = "Вторыу блюда"
    case drinks = "Напитки"
    case desert = "Десерты"
    case salat = "Салаты"
    }
