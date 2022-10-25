//
//  InfoView.swift
//  JoseCard
//
//  Created by Jose Velazquez on 10/24/22.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.white)
            .frame(height: 50)
            .overlay(HStack {
            Image(systemName: imageName)
                .foregroundColor(Color(red: 0.83, green: 0.33, blue: 0.00))
                Text(text)
        })
        .padding(.all)
            
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}


