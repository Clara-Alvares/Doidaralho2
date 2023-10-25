//
//  NomeJogadores.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 16/05/23.
//

//import SwiftUI
//
//struct NomeJogadores: View {
//    
//    @Binding var njogadores:Int
//    @State var jogadores:[String] = []
//    @State var caixatext:String = ""
//    @State private var scrollPosition: CGFloat = 0
//    @Binding var path:[ViewsTela]
//    
//    
//    var body: some View {
//        
//        ZStack{
//            
//            Color(.black)
//                .edgesIgnoringSafeArea(.all)
//            
//            VStack{
//                
//                Text("Insira o nome dos jogadores")
//                    .font(.custom("Montserrat-Bold", size: 30))
//                    .foregroundColor(Color("rosaPink"))
//                    .multilineTextAlignment(.center)
//                
//                HStack{
//                    
//                    //Caixa de texto, para o usuário inserir o nome
//                    
//                    TextField("Insira os jogadores", text: $caixatext)
//                        .textFieldStyle(.roundedBorder)
//                        .foregroundColor(Color("rosaPink"))
//                    
//                    //Botão de adicionar
//                    
//                    Button {
//                        
//                        jogadores.append(caixatext)
//                        caixatext = ""
//                        
//                    } label: {
//                        ZStack {
//                            // Capsule().frame(width: 80, height: 40).foregroundColor(Color("rosa2"))
//                            Text("Adicionar").fontWeight(.medium).foregroundColor(Color("rosaTexto")).font(.system(size: 13))
//                        }
//                    }
//                    .buttonStyle(.borderedProminent).tint(Color("rosaPink"))
//                    .disabled(njogadores==jogadores.count)
//                }.padding(.top, 20)
//                
//                ScrollViewReader { scrollView in
//                    ScrollView(.vertical) {
//                        VStack{
//                            ForEach(0..<jogadores.count, id:\.self){ contagem in
//                                HStack{
//                                    Text(jogadores[contagem])
//                                        .font(.custom("Montserrat-Medium", size: 20))
//                                        .foregroundColor(Color("rosaTexto"))
//                                    Spacer()
//                                    
//                                    Button{
//                                        
//                                        jogadores.remove(at: contagem)
//                                        
//                                    }label: {
//                                        
//                                        Image(systemName: "minus.circle")
//                                            .font(.system(size: 25))
//                                            .foregroundColor(Color("rosaPink"))
//                                        
//                                    }
//                                }.padding(.top, 15)
//                                
//                            }
//                        }.onChange(of: jogadores.count) { _ in
//                            withAnimation {
//                                scrollView.scrollTo(jogadores.count - 1, anchor: .bottom)
//                            }
//                        }.padding()
//                    }
//                }
//                Spacer()
//                
//                Text("\(jogadores.count)/\(njogadores)").foregroundColor(Color("rosaTexto"))
//                
//                if njogadores==jogadores.count{
//                    Text("Vamos começar? Seja responsável... ou não 🤪")
//                        .font(.custom("Montserrat", size: 15))
//                        .foregroundColor(Color("rosaTexto"))
//                }
//                
//                NavigationLink{
//                    Jogo(njogadores: $njogadores, jogadores: $jogadores, path: $path)
//                } label: {
//                    
//                    if njogadores==jogadores.count {
//                        ZStack{
//                            Capsule().frame(width: 150, height: 50).foregroundColor(Color("rosaPink"))
//                            Text("Jogar").foregroundColor(Color("rosaTexto"))
//                        }
//                    } else {
//                        ZStack{
//                            Capsule().frame(width: 150, height: 50).foregroundColor(Color("rosa2"))
//                            Text("Jogar").foregroundColor(Color("rosaTexto"))
//                        }
//                    }
//                }.disabled(njogadores>jogadores.count)
//                    .accentColor(Color("rosaPink"))
//            }
//        }
//    }
//}
//
//
//struct Teste: View {
//    var body: some View{
//        Text("Oi")
//    }
//}
//
//struct NomeJogadores_Previews: PreviewProvider {
//    static var previews: some View {
//        //Teste()
//        NomeJogadores(njogadores: .constant(6), caixatext: "", path: .constant([]))
//    }
//}
