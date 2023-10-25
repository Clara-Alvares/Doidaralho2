//
//  TelaInicialVM.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 24/10/23.
//

import Foundation
import SwiftUI

class TelaInicialVM: ObservableObject {
    
    func viewForTela(_ tela: ViewsTela, path: Binding<[ViewsTela]>, jogadores: Binding<[String]>, njogadores: Binding<Int>) -> AnyView {
        
        switch tela {
            
//        case .TelaInicial:
//            return AnyView(TelaInicial(jogadores: $jogadores, njogadores: $njogadores, teste: TelaInicialVM(jogadores: $jogadores, njogadores: $njogadores, path: $path)))
        case .Baralhos:
            return AnyView(Baralhos())
        case .TelaInsiraJogadores:
            return AnyView(TelaInsiraJogadores(jogadores: jogadores, path: path))
//            EmptyView()
        case .NomeJogadores:
            return AnyView(NomeJogadores(njogadores: njogadores, path: path))
        case .Jogo:
            return AnyView(Jogo(njogadores: njogadores, jogadores: jogadores, path: path))
                           
        }
    }
}
