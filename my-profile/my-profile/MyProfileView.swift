//
//  MyProfileView.swift
//  my-profile
//
//  Created by Rodrigo Gonçalves de Queiroz on 26/09/22.
//

import SwiftUI

struct MyProfileView: View {
    
    @EnvironmentObject var viewModel: MyProfileViewModel
    
    var body: some View {
        
        VStack {
            
            ProfileInfoView()
            ActionView()
        }
        .animation(.easeInOut, value: viewModel.isFollowing)
        
    }
}

struct ProfileInfoView: View {
    
    @EnvironmentObject var viewModel: MyProfileViewModel
    
    var body: some View {
        
        Image(systemName: viewModel.profile.picture)
            .resizable()
            .frame(width: 250, height: 250)
            .padding(.bottom, 10)
        
        Text(viewModel.profile.name)
            .font(.system(size: 30, weight: .bold))
        
        Text(viewModel.profile.nick)
            .font(.system(size: 23, weight: .regular))
            .foregroundColor(.gray)
        
        Text("\(viewModel.userFollowers)")
            .font(.system(size: 60, weight: .light))
            .padding(viewModel.isFollowing ? 40 : 35)
        
    }
}

struct ActionView: View {
    
    @EnvironmentObject var viewModel: MyProfileViewModel
    
    var body: some View {
        
        VStack {
            
            Button {
                viewModel.followToogle()
            } label: {
                Label(!viewModel.isFollowing ? "follow" : "unfollow",
                      systemImage: !viewModel.isFollowing ? "person.badge.plus" : "person.badge.minus")
                .font(.title3)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(!viewModel.isFollowing ? .blue : .black)
            
            Button {} label: {
                Label("Enviar mensagem", systemImage: "message")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .disabled(!viewModel.isFollowing)
            
        }
        .padding(20)
        
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
            .environmentObject(MyProfileViewModel())
    }
}
