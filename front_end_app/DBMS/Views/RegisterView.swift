//
//  RegisterView.swift
//  DBMS
//
//  Created by 婕瑜 on 2021/12/14.
//
import SwiftUI

struct RegisterView: View {
    // TextField Style setting
    public struct CustomTextFieldStyle : TextFieldStyle {
            public func _body(configuration: TextField<Self._Label>) -> some View {
                configuration
                    .padding(15)
                    .background(Color(.systemGray3))
                    .font(.title3)
                    .background(
                       RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.primary.opacity(0.5), lineWidth:100)).foregroundColor(.blue)
            }
    }
    
    @State var newaccount = ""
    @State var oncePassword = ""
    //Appearance
    var body: some View {
        VStack{
            ZStack {
                VStack {
                    Spacer()
                    Spacer()
           
                        Text("建立帳戶")
                            .font(.title)
                            .bold()
                            .padding(.bottom).foregroundColor(.black)
                    Spacer()
                        VStack(alignment: .leading) {
                            TextField("帳號", text: $newaccount)
                                .textFieldStyle(CustomTextFieldStyle()).cornerRadius(10).multilineTextAlignment(.leading)
                            TextField("密碼", text: $oncePassword)
                                .textFieldStyle(CustomTextFieldStyle()).cornerRadius(10).multilineTextAlignment(.leading).foregroundColor(.white)
                        }.padding([.leading, .bottom, .trailing])

                    Button(action: {
                        let address = "http://140.119.163.196:8081/user"
                        //POST
                        var request = URLRequest(url: URL(string: address)!)
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        request.httpMethod = "POST"
                        
                        let parameters = ["username": newaccount, "password": oncePassword]
                        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

                        request.httpBody = jsonData
                        
                        URLSession.shared.dataTask(with: request) { (data, response, error) in
                            if let error = error {
                                print("Error: \(error.localizedDescription)")
                            } else if let response = response as? HTTPURLResponse,let data = data {
                                print(data)
                                print("Status code: \(response.statusCode)")
                                if response.statusCode == 200 {
                                    print("ok")
                                }
                            }
                        }.resume()
                    }
                    , label: {
                        Text("建立帳戶").font(.headline).bold()
                    }).padding(14.0).frame(width: 385.0, height: 50.0).background(Color(.systemGray3)).cornerRadius(12).foregroundColor(Color(.white))
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.all).multilineTextAlignment(.center)
        }
    }
}

// NOT YET = Save new account func 
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
