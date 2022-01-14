//
//  ContentView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/14.
//

import SwiftUI

var userAccount = ""

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
    
    @State var account = "user"
    @State var password = "defaultpassword"
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
        let address = "http://140.119.163.196:8081/login"
        //POST
        var request = URLRequest(url: URL(string: address)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let parameters = ["username": account, "password": password]
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let response = response as? HTTPURLResponse,let data = data {
                print(data)
                print("Status code: \(response.statusCode)")
                if response.statusCode == 200 {
                    userAccount = account
                    showinghomescreen = true
                }
            }
        }.resume()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

