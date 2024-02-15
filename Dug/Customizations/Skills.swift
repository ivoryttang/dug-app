//
//  Skills.swift
//  Dug
//
//  Created by Ivory Tang on 2/8/24.
//

import SwiftUI

struct Skills: View {
    var body: some View {
        ScrollView {
                
            Text("Skills").font(.largeTitle).foregroundColor(Color("bubbles-background"))
            
//                voice
            VStack {
                
                HStack{
                    Image(systemName: "mic").frame(width: 10)
                    VStack(alignment: .leading){
                        Text("Sing").bold()
                        Text("Sing a solo or duet your pet").foregroundColor(.white)                        }.frame(width: 260)
                    
                    
                }
                
            }
                .frame(width: 360,height: 80) // Set the fixed width
                .background(Color("bubbles-background"))
                .foregroundColor(.white)
                .cornerRadius(8)
//                personality
            VStack {
                
                HStack{
                    Image(systemName: "function").frame(width: 0)
                    VStack(alignment: .leading){
                        Text("Knowledge").bold()
                        Text("Teach your pet knowledge").foregroundColor(.white)                       }.frame(width: 260)
                  
                    
                }
                
            }
                .frame(width: 360,height: 80) // Set the fixed width
                .background(Color("bubbles-background"))
                .foregroundColor(.white)
                .cornerRadius(8)
//          Skills
            VStack {
                
                HStack{
                    Image(systemName: "lightbulb.fill").frame(width: 10)
                    VStack(alignment: .leading){
                        Text("Jokes").bold()
                        Text("Let your pet tell some jokes").foregroundColor(.white)                       }.frame(width: 260)
                    
                }
                
            }
                .frame(width: 360,height: 80) // Set the fixed width
                .background(Color("bubbles-background"))
                .foregroundColor(.white)
                .cornerRadius(8)
            
        }
        
    }
}

struct Skills_Previews: PreviewProvider {
    static var previews: some View {
        Skills()
    }
}
