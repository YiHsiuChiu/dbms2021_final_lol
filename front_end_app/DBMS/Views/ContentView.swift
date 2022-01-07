//
//  ContentView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/14.
//

import SwiftUI


struct ContentView: View {
    
    // TextField Style setting
    public struct CustomTextFieldStyle : TextFieldStyle {
            public func _body(configuration: TextField<Self._Label>) -> some View {
                configuration
                    .padding(15)
                    .background(Color(.systemGray3))
                    .font(.title3)
                    .background(
                       RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.primary.opacity(0.5), lineWidth:100))
                    
            }
    }
    
    @State var account = ""
    @State var password = ""
    @State var wrongaccount = 0
    @State var wrongpassword = 0
    @State var showinghomescreen = false

    // Appearance
    var body: some View {
        if showinghomescreen {
            TabBarView()
        }
        
        else {
            NavigationView {
            VStack{
                ZStack {
                    VStack {
                        Spacer()
                        
                        Text("英雄聯盟賽事即時投票APP")
                            .font(.title)
                            .bold()
                            .padding().foregroundColor(.black)
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            TextField("帳號", text: $account)
                                .textFieldStyle(CustomTextFieldStyle()).cornerRadius(10).multilineTextAlignment(.leading)
                            TextField("密碼", text: $password)
                                .textFieldStyle(CustomTextFieldStyle()).cornerRadius(10).multilineTextAlignment(.leading).foregroundColor(.white)
                            
                        }
                        .padding([.leading, .bottom, .trailing])
                        
                        
                        VStack {
                            Button(action: {
                                authenticateUser(account: account, password: password)
                            }, label: {
                                    Text("登入").font(.title3).bold()
                                   }).padding(.all, 14.0).frame(width: 385.0, height: 50.0).background(Color(.systemGray3)).cornerRadius(12).keyboardType(.namePhonePad).foregroundColor(.white)
                            
                            Text("尚未建立帳戶嗎？").font(.title3).foregroundColor(.black).padding(.top)
                                
                                NavigationLink(
                                    destination: RegisterView(),
                                    label: {
                                        Text("建立帳戶").font(.title3).foregroundColor(Color(.blue))
                                    })
                                    .padding(.top)
                            
                        }
                        Spacer()
                        Spacer()
                        
                    }
                }.edgesIgnoringSafeArea(.all).multilineTextAlignment(.center)
            }
            
        }
        }
        
    }
    
    // Username/Password check func
    func authenticateUser(account: String, password: String) {
        if account == "Test" {
            wrongaccount = 0
            if password == "Test" {
                wrongpassword = 0
                showinghomescreen = true
            } else {
                wrongpassword = 2
            }
        } else {
            wrongaccount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
