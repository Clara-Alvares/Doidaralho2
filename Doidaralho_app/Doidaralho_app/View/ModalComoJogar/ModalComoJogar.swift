//
//  ModalComoJogar.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 24/10/23.
//

import Foundation
import SwiftUI

struct ModalComoJogar: View {
    @Binding var comoJogar:Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Instruções")
                    .font(.custom("Montserrat-Bold", size: 40))
                    .foregroundColor(Color("rosaPink"))
                
                Spacer()
                
                Text("Doidaralho é um jogo alcoólico que promete boas risadas entre os amigos!")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
                Spacer()
                
                Text("Inicialmente, ele foi desenvolvido na versão física (está disponível para compra no nosso Instagram @alv.fun) e agora chegou a versão digital para dispositivos IOS.")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
                Spacer()
                
                Text("O baralho inicial possui 35 cartas gratuitas, mas você pode adquirir novos decks para aprimorar sua experiencia e explorar novos desafios.")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
                Spacer()
                
                Text("Jogo destinado para maiores de idade. Respeite seus limites.")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
                Spacer()
                
            }.frame(height: 380)
            
            
            
            VStack(alignment: .leading) {
                Text("Como jogar")
                    .font(.custom("Montserrat-Bold", size: 25))
                    .foregroundColor(Color("rosaPink"))
                
                Spacer()
                
                Text("+2 jogadores")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
                Spacer()
                
                Text("1. Selecione a quantidade de jogadores;")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
                Spacer()
                
                Text("2. Escolha entre nomeá-los ou usar nomes aleatórios (jogador 1, jogador 2…);")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
                Spacer()
                
                Text("3. Arraste as cartas para ir para a próxima e respeite a vez de cada jogador.")
                    .font(.custom("Montserrat-Medium", size: 17))
                    .foregroundColor(Color("rosaTexto"))
                
            }.frame(height: 200)
            Spacer()
        }.padding()
    }
}
