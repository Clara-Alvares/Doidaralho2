////
////  Jogo.swift
////  Doidaralho_app
////
////  Created by Clara Alvares Barbosa on 16/05/23.
////
//
//import SwiftUI
//
//
//struct Jogo: View {
//    
//    @Binding var njogadores:Int // numero de jogadores
//    @Binding var jogadores:[String] // nomes especificos
//    @State var aleatorio:[String] = [] // aleatorio
//    @State var nomesJogadores:[String] = [ ] // ARRAY OFICIAL DO JOGO, ALEATORIO ou JOGADORES
//    @State var toggle:Bool = false
//    @Binding var path:[ViewsTela]
//    
//    @State var cartas:[Carta] = [
//        Carta(id: 0, imagem: "Carta01"),
//        Carta(id: 1, imagem: "Carta02"),
//        Carta(id: 2, imagem: "Carta03"),
//        Carta(id: 3, imagem: "Carta04"),
//        Carta(id: 4, imagem: "Carta05")
//    ]
//    
//    @State var cartasRemovidas: [Carta] = []
//    
//    @State private var indiceJogadores:Int = 0
//    
//    private var maximoID: Int {
//        return self.cartas.map { $0.id }.max() ?? 0
//    }
//    
//    private func larguraCarta(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//        let offset: CGFloat = CGFloat(cartas.count - 1 - id) * 10
//        return geometry.size.width - offset
//    }
//    
//    private func posicaoCarta(_ geometry: GeometryProxy, id: Int) -> CGFloat {
//        return CGFloat(cartas.count - 1 - id) * 10
//    }
//    
//    func gerarNomesAleatorios() {
//        for numero in 0..<njogadores{
//            aleatorio.append("Jogador \(numero + 1)")
//        }
//    }
//    
//    func nomes() {
//        
//        if jogadores.count >= 2 {
//            nomesJogadores.append(contentsOf: jogadores)
//        } else {
//            nomesJogadores.append(contentsOf: aleatorio)
//        }
//        
//    }
//    
//    @State var alertaMenu = false
//    
//    @State var toggle1:Bool = false
//    @State var toggle2:Bool = false
//    
//    var body: some View {
//        
//        
//        ZStack{
//            
//            //Cor tela de fundo
//            Color(.black)
//                .edgesIgnoringSafeArea(.all)
//            
//            VStack{
//                
//                HStack{
//                    Spacer()
//                    
//                    Button {
//                        alertaMenu = true
//                    } label: {
//                        Image(systemName: "ellipsis.circle")
//                            .font(.system(size: 30))
//                            .foregroundColor(Color("rosaPink"))
//                    }
//                    
//                    
//                    
//                    //                        Image(systemName: "ellipsis.circle")
//                    //                            .font(.system(size: 30))
//                    //                        //.frame(width: 40, height: 40)
//                    //                            .foregroundColor(Color("rosaPink"))
//                    
//                }
//                .padding(.top, 40)
//                .padding(.trailing, 20)
//                
//                ZStack{
//                    
//                    Image("logoRosa")
//                        .padding(.bottom, 700)
//                        .padding(.trailing, 42)
//                    
//                    //Condicao, se carta mudar muda esse nome aqui
//                    if nomesJogadores.count > 0 {
//                        Text("Agora: \(nomesJogadores[indiceJogadores])")
//                            .font(.custom("Montserrat-Medium", size: 25))
//                            .foregroundColor(Color("rosaTexto"))
//                            .padding(.bottom, 550)
//                            .padding(.trailing, 42)
//                    }
//                    
//                    Rectangle().foregroundColor(Color("rosa2")).frame(width: 328, height: 431).cornerRadius(25)
//                    
//                    Rectangle().foregroundColor(Color("rosa3")).frame(width: 328, height: 431).cornerRadius(25).padding(.leading, -20).padding(.bottom, 20)
//                    
//                    GeometryReader {geometry in
//                        
//                        ZStack {
//                            
//                            ForEach(self.cartas, id: \.id) { carta in
//                                
//                                //if (self.maximoID - 2)...self.maximoID ~= carta.id {
//                                
//                                CartasView(carta: carta, removendo: { cartaRemovida in
//                                    self.cartas.removeAll { $0.id == cartaRemovida.id}
//                                    self.indiceJogadores = (self.indiceJogadores + 1) % self.nomesJogadores.count
//                                    cartasRemovidas.insert(cartaRemovida, at: 0)
//                                    
//                                })
//                                
//                                //                                }
//                            }
//                            .padding(.trailing, 35)
//                            //                                }//carta pra direita
//                            
//                            
//                        }.padding(.top, 143) //Carta pra baixo
//                        
//                    }
//                    
//                    
//                    
//                    if nomesJogadores.count > 0 {
//                        Text("Próximo: \(nomesJogadores[(indiceJogadores + 1) % nomesJogadores.count])")
//                            .font(.custom("Montserrat-VariableFont-wght.ttf", size: 25))
//                            .foregroundColor(Color("rosaTexto"))
//                            .padding(.top, 520)
//                            .padding(.trailing, 42)
//                    }
//                    
//                    
//                }.padding(.leading, 40)
//            }.navigationBarBackButtonHidden(true)
//                .onAppear() {
//                    gerarNomesAleatorios()
//                    nomes()
//                    cartas.shuffle()
//                }
//            
//            if cartas.count == 0 {
//                
//                ZStack {
//                    Color("cinza3").opacity(0.8).edgesIgnoringSafeArea(.all)
//                    ZStack {
//                        Rectangle().foregroundColor(Color("rosaPink")).frame(width: UIScreen.main.bounds.width * 0.93, height: 500).cornerRadius(25)
//                        VStack{
//                            Text("FIM DAS CARTAS 🍻").font(.custom("Montserrat-Bold", size: 26)).multilineTextAlignment(.center).foregroundColor(Color("rosaTexto"))
//                            
//                            Spacer()
//                            
//                            Text("Que pena que chegou ao fim 🥴 mas chegando aqui você já é considerado(a) vitorioso(a) por nós!").font(.custom("Montserrat-Medium", size: 18)).multilineTextAlignment(.center).foregroundColor(Color("rosaTexto"))
//                            Spacer()
//                            
//                            Text("Agora você tem duas opções:").font(.custom("Montserrat-Bold", size: 18)).multilineTextAlignment(.center).foregroundColor(Color("rosaTexto"))
//                            Spacer()
//                            
//                            Text("Se você ainda está com energia para continuar jogando, pode começar novamente com as cartas que já possui, mas se a sua sede de desafio é insaciável, adquira um novo baralho  😜🍸🎉").font(.custom("Montserrat-Medium", size: 18)).multilineTextAlignment(.center).foregroundColor(Color("rosaTexto"))
//                            
//                            Spacer()
//                            
//                            HStack{
//                                
//                                NavigationLink{
//                                    Jogo(njogadores: $njogadores, jogadores: $jogadores, path: $path)
//                                } label: {
//                                    ZStack{
//                                        Capsule().frame(width: UIScreen.main.bounds.width * 0.43, height: 50).foregroundColor(Color("rosa2"))
//                                        Text("Começar novamente").foregroundColor(Color("rosaTexto")).font(.custom("Montserrat-Medium", size: 14))
//                                    }
//                                }
//                                
//                                Spacer()
//                                
//                                NavigationLink(destination: Baralhos(), isActive: $toggle){
//                                    EmptyView()
//                                }
//                                
//                                Button {
//                                    toggle.toggle()
//                                } label: {
//                                    ZStack{
//                                        Capsule().frame(width: UIScreen.main.bounds.width * 0.43, height: 50).foregroundColor(Color("rosa2"))
//                                        Text("Comprar baralho novo").foregroundColor(Color("rosaTexto")).font(.custom("Montserrat-Medium", size: 14))
//                                    }
//                                }
//                                
//                            }
//                            
//                        }.padding().frame(width: UIScreen.main.bounds.width * 0.90, height: 500)
//                    }
//                }
//            }
//            
//            if alertaMenu == true {
//                ZStack {
//                    Color("cinza3").opacity(0.8).edgesIgnoringSafeArea(.all)
//                    Rectangle().cornerRadius(20).frame(width: 350, height: 240).foregroundColor(.black)
//                    VStack {
//                        Text("Menu") .font(.custom("Montserrat-Bold", size: 50))
//                            .foregroundColor(Color("rosaPink"))
//                        
//                        Spacer()
//                        //
//                        //                            NavigationLink(destination: Jogo(njogadores: $njogadores, jogadores: $jogadores), isActive: $toggle1){
//                        //                                EmptyView()
//                        //                            }
//                        
//                        Button {
//                            alertaMenu.toggle()
//                        } label: {
//                            ZStack {
//                                Capsule().frame(width: 180, height: 50).foregroundColor(Color("rosaPink"))
//                                Text("Voltar ao jogo").foregroundColor(Color("rosaTexto"))
//                            }
//                        }
//                        Spacer()
//                        Button {
//                            print(path.count)
//                            path = []
//                            print(path.count)
//                        } label: {
//                            ZStack {
//                                Capsule().frame(width: 180, height: 50).foregroundColor(Color("rosa3"))
//                                Text("Tela inicial").foregroundColor(Color("rosaTexto"))
//                            }
//                        }
//
////                        NavigationLink(destination: TelaInicial(jogadores: $jogadores, njogadores: $njogadores), isActive: $toggle2){
////                            EmptyView()
////                        }
////
////                        Button {
////                            toggle2.toggle()
////                            
////                        } label: {
////                            ZStack {
////                                Capsule().frame(width: 180, height: 50).foregroundColor(Color("rosa3"))
////                                Text("Tela inicial").foregroundColor(Color("rosaTexto"))
////                            }
////                        }
//                        
//                        
//                    }.frame(width: 350, height: 200)
//                        .padding(.bottom, 12)
//                }
//            }
//        }
//    }
//}
//
//
//
//
//
//
//
//struct Jogo_Previews: PreviewProvider {
//    static var previews: some View {
//        Jogo(njogadores: .constant(3), jogadores: .constant(["Default"]), path: .constant([.Jogo]))
//    }
//}
//
//
