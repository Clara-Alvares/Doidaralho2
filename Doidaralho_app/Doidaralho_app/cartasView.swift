//
//  cartasView.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 18/05/23.
//

import SwiftUI

struct Carta: Hashable {
    let id:Int
    let imagem:String
}


struct Teste1: View{
    
    @State var showAlert = false
//    @Binding var njogadores:Int
//    @Binding var jogadores:[String]
    
    var body: some View{
        Text("oi")
      
    }
}

struct CartasView: View {
    
    @State private var translation: CGSize = .zero
    //Antes tava state
    private var carta: Carta
    private var removendo: (_ carta: Carta) -> Void
    //Quando o usuário arrastar a imagem 50% da largura da tela em qualquer direção, ela vai ser removida
    private var limitePorcentagem: CGFloat = 0.5
    
    init(carta: Carta, removendo: @escaping (_ carta: Carta) -> Void) {
        self.carta = carta
        self.removendo = removendo
    }
    
    private func porcentagemGesto(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
//                Image(self.carta.imagem)
                Image(self.carta.imagem)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 328, height: 431)
                   // .clipped()
            }
            //.shadow(radius: 5)
            .offset(x: self.translation.width, y: self.translation.height)
            .animation(.interactiveSpring())
            .rotationEffect(.degrees(Double(self.translation.width/geometry.size.width) * 25), anchor: .bottom)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        self.translation = value.translation
                    }.onEnded { value in
                        if abs(self.porcentagemGesto(geometry, from: value)) > self.limitePorcentagem {
                            self.removendo(self.carta)
                        } else {
                            self.translation = .zero
                        }
                    }
            )
        }
    }
}

struct CartasView2_Previews: PreviewProvider {
    static var previews: some View {
        Teste1()
//            .frame(height: 431).padding()
    }
}
