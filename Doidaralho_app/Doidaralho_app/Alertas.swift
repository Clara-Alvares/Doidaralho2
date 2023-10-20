//
//  Alertas.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 21/05/23.
//

import SwiftUI

struct Alertas: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ComoJogar: View {
    
    @State var toggle1:Bool = false
    @State var toggle2:Bool = false
    @Binding var njogadores:Int
    @Binding var jogadores:[String]
    @Binding var path:[ViewsTela]
   
    
    var body: some View {
        ZStack {
            Color("cinza3").opacity(0.8).edgesIgnoringSafeArea(.all)
            Rectangle().cornerRadius(20).frame(width: 350, height: 280)
            VStack {
                Text("Menu") .font(.custom("Montserrat-Bold", size: 50))
                    .foregroundColor(Color("rosaPink"))
                
                Spacer()
                
                NavigationLink(destination: Jogo(njogadores: $njogadores, jogadores: $jogadores, path: $path), isActive: $toggle1){
                    EmptyView()
                }
                
                Button {
                    toggle1.toggle()
                } label: {
                    ZStack {
                        Capsule().frame(width: 180, height: 50).foregroundColor(Color("rosaPink"))
                        Text("Voltar ao jogo").foregroundColor(Color("rosaTexto"))
                    }
                }
                Spacer()
                
                Button {
                    path = []
                } label: {
                    ZStack {
                        Capsule().frame(width: 180, height: 50).foregroundColor(Color("rosa3"))
                        Text("Tela inicial").foregroundColor(Color("rosaTexto"))
                    }
                }

                
            }.frame(width: 350, height: 150)
        }
    }
}

struct Alertas_Previews: PreviewProvider {
    static var previews: some View {
        ComoJogar(njogadores: .constant(3), jogadores: .constant(["Default"]), path: .constant([]))
    }
}
