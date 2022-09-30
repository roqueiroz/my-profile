//
//  my_profileApp.swift
//  my-profile
//
//  Created by Rodrigo Gonçalves de Queiroz on 26/09/22.
//

import SwiftUI

@main
struct my_profileApp: App {
    var body: some Scene {
        WindowGroup {
            MyProfileView()
                .environmentObject(MyProfileViewModel())
        }
    
    }
}
