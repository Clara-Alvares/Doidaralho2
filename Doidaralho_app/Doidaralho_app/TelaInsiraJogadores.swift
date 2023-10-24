//
//  TelaInsiraJogadores.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 12/05/23.
//

import SwiftUI

struct TelaInsiraJogadores: View {

    @State var njogadores:Int = 2
    @State  var irjogo:Bool = false
    @Binding var jogadores:[String]
    @Binding var path:[ViewsTela]
    
    
    var body: some View {
        
                    ZStack{
                        //Cor do fundo
                        Color(.black)
                            .edgesIgnoringSafeArea(.all)
        
        VStack{
            
            Text("Estabeleça os jogadores")
                .font(.custom("Montserrat-Bold", size: 40))
                .foregroundColor(Color("rosaPink"))
                .multilineTextAlignment(.center)
            
            
            Text("Selecione a quantidade")
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundColor(Color("rosaTexto"))
                .padding(.top, 50)
            
            Picker("Number", selection: $njogadores) {
                ForEach(2...20, id: \.self) { number in
                    Text("\(number)")
                        .fontWeight(.heavy)
                        .foregroundColor(Color("rosaPink"))
                }
            }
            .pickerStyle(.wheel)
            .frame(width: 50, height: 150)
            .padding(.bottom, 30)
            
            
            Text("Modo de nomeação")
                .font(.custom("Montserrat-Medium", size: 16))
                .foregroundColor(Color("rosaTexto"))
            
            //Botão para nomear os jogadores
            NavigationLink{
                NomeJogadores(njogadores: $njogadores, caixatext: "", path: $path)
            } label: {
                ZStack {
                    Capsule().frame(width: 220, height: 50).foregroundColor(Color("rosaPink"))
                    Text("Personalizado")
                        .font(.custom("Montserrat", size: 16))
                        .foregroundColor(Color("rosaTexto"))
                }
            }.padding(.top, 45)

            
            
            
            Button {
                print(path)
                path.append(.Jogo)
                //irjogo.toggle()
            } label: {
                ZStack {
                    Capsule().frame(width: 220, height: 50).foregroundColor(Color("rosaPink"))
                    Text("Aleatório")
                        .font(.custom("Montserrat", size: 16))
                        .foregroundColor(Color("rosaTexto"))
                }
            }.padding(.top, 25)
            
            Spacer()
            
        }
    }.accentColor(Color("AccentColor"))

                    
            }
            }
            


struct TelaInsiraJogadores_Previews: PreviewProvider {
    static var previews: some View {
        TelaInsiraJogadores(jogadores: .constant(["Default"]), path: .constant([]))
    }
}
