//
//  AdminProductCell.swift
//  RestaurantIOS
//
//  Created by Evgeniy Sergeev on 27.04.2023.
//

import SwiftUI

struct AdminProductCell: View {
    var product: Product
    var body: some View {
        HStack {
            Image("bg")
                .resizable()
                .frame(width: 80, height: 70)
                .aspectRatio( contentMode:.fill)
                .clipShape(Rectangle())
            VStack(alignment: .leading,spacing: 10) {
                Text(product.title)
                Text("\(product.price)р")
            }.bold()
            Spacer()

        }
    }
}

struct AdminProductCell_Previews: PreviewProvider {
    static var previews: some View {
        AdminProductCell(product: defProducts[0])
    }
}
