//
//  CustomTabView.swift
//  RetoTC2007B
//

import SwiftUI

struct CustomTabView: View {
    
    @Binding var selectedPage: Page
    
    private var fillImage: String {
        selectedPage.imageName + ".fill"
    }
    
    var body: some View {
        
        
        HStack {
            ForEach(Page.allCases, id: \.self) { page in
                Button {
                    selectedPage = page
                } label: {
                    Spacer()
                    
                    VStack(spacing: 4) {
                        Image(systemName: selectedPage == page ? fillImage : page.imageName)
                            .font(.system(size: 24, weight: .bold))
                        Text(page.title)
                            .font(.system(size: 11, weight: .bold))
                    }
                    .scaleEffect(selectedPage == page ? 1.20 : 1.0)
                    .foregroundColor(selectedPage == page ? Color(.white) : Color("NotSelected"))
                    
                    Spacer()
                }
                
            }
        }
        .frame(width: nil, height: 80)
        .background(Color("Nav"))
        .cornerRadius(15)
        .padding(.horizontal, 5)
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(selectedPage: .constant(.inicio))
    }
}
