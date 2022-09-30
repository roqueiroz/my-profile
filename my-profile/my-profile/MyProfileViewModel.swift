//
//  MyProfileViewModel.swift
//  my-profile
//
//  Created by Rodrigo Gonçalves de Queiroz on 26/09/22.
//

import Foundation

class MyProfileViewModel: ObservableObject {
    
    @Published var isFollowing: Bool = false
    @Published var userFollowers: String = ""
    
    var profile = Profile(
        picture: "rodrigo_queiroz",
        name: "Rodrigo Queiroz",
        nick: "@rodrigoqueiroz",
        followers: 22643
    )
    
    init() {
        loadFollowers()
    }

    func loadFollowers() {
        self.userFollowers = formatNumber(value: profile.followers)
    }
    
    func followToogle() {
        
        self.isFollowing.toggle()
        self.isFollowing ? (self.profile.followers += 1) : (self.profile.followers -= 1)
        
        loadFollowers()
    }
    
    func formatNumber(value: Double) -> String {
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "pt_BR")
        
        let formatedNumber = formatter.string(for: value) ?? "0"
        
        return "\(formatedNumber)K"
    }
}
