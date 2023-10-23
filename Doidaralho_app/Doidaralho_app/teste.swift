//
//  teste.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 07/08/23.
//

import SwiftUI

enum ViewsTela {
//    case TelaInicial
    case Baralhos
    case TelaInsiraJogadores
    case NomeJogadores
    case Jogo 
}

struct TelaInicial: View {
    
    @Binding  var jogadores:[String]
    @State var comoJogar:Bool = false
    @State var path:[ViewsTela] = []
    @Binding var njogadores: Int
    
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
                
                switch tela {
                    
                case .Baralhos:
                    Baralhos()
                case .TelaInsiraJogadores:
                    TelaInsiraJogadores(jogadores: $jogadores, path: $path)
                    EmptyView()
                case .NomeJogadores:
                    NomeJogadores(njogadores: $njogadores, path: $path)
                case .Jogo:
                    Jogo(njogadores: $njogadores, jogadores: $jogadores, path: $path)
                    
                }
                
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

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



struct TelaInicial_Previews: PreviewProvider {
    static var previews: some View {
        TelaInicial(jogadores: .constant(["Default"]), njogadores: .constant(6))
    }
}
