//
//  ContentView.swift
//  JoseCard
//
//  Created by Jose Velazquez on 10/24/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.83, green: 0.33, blue: 0.00)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("jose").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.white,lineWidth: 5))
                Text("Jose Velazquez")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("IOS Developer").foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(text: "+1 787 696 5824", imageName: "phone.fill")
                InfoView(text: "jevs242@gmail.com", imageName: "envelope.fill")
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

