//
//  Doidaralho_appApp.swift
//  Doidaralho_app
//
//  Created by Clara Alvares Barbosa on 12/05/23.
//

import SwiftUI

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait // Define a orientação retrato como a única permitida
    }
}

@main
struct Doidaralho_appApp: App {
    
    @State var jogadores:[String] = []
    @State var njogadores:Int = 0
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    init() {
            // Define o modo escuro como a aparência global do aplicativo
            UIApplication.shared.windows.forEach { window in
                window.overrideUserInterfaceStyle = .dark
            }
        }
    
    
    var body: some Scene {
        WindowGroup {
//            TelaInicial(jogadores: .constant(["Default"]))
            TelaInicial(jogadores: $jogadores, njogadores: $njogadores)
        }
    }
}

