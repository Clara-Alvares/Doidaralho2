//
//  TelaInicial.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 24/10/23.
//

import Foundation
import SwiftUI



struct TelaInicial: View {
    
    @Binding  var jogadores:[String]
    @State var comoJogar:Bool = false
    @State var path:[ViewsTela] = []
    @Binding var njogadores: Int
    @StateObject var teste = TelaInicialVM()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            
            ZStack{
                //Cor do fundo
                Color(.black)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    
                    //Logo DOIDARALHO
                    Image("LOGO")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 70)
                    
                    Spacer()
                    
                    //Botoes
//                    Navigati
                  
                    Button {
                        path.append(.TelaInsiraJogadores)
                    } label: {
                        Image("botaoPlay1").resizable().frame(width: 180,height: 180)
                    }

                                    
                    Spacer()
                    
                    NavigationLink {
                        Baralhos()
                    } label: {
                        Image("BaralhosBotao").resizable().frame(width: 100,height: 100).padding(.bottom, 130)
                    }
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        Link(destination: URL(string: "https://instagram.com/alv.fun?igshid=MzRlODBiNWFlZA==")!) {
                            Image("instagram").padding(.leading, 50)
                        }
                        Spacer()
                        
                        
                        
                        Button {
                            comoJogar.toggle()
                        } label: {
                            Image(systemName: "doc.text")
                                .fontWeight(.semibold)
                                .font(.system(size: 36))
                            //  .font(.custom("SF-Pro-Display-Black", size: 47))
                                .foregroundColor(Color("rosaPink"))
                                .padding(.trailing, 50)
                        }.sheet(isPresented: $comoJogar) {
                            ModalComoJogar(comoJogar: $comoJogar)
                        }

                        
                        Spacer()
                    }
                    
                    
                }
                .padding()
                
            }
            .accentColor(Color("AccentColor"))
            .navigationDestination(for: ViewsTela.self) { tela in
                teste.viewForTela(tela, path: $path, jogadores: $jogadores, njogadores: $njogadores)
            }
            
            
        }.navigationBarBackButtonHidden(true)
    }
}





//struct TelaInicial_Previews: PreviewProvider {
//    static var previews: some View {
//        TelaInicial(jogadores: .constant(["Default"]), njogadores: .constant(6), teste: TelaInicialVM(jogadores: .constant(["Default"]), njogadores: .constant(6)))
//    }
//}
