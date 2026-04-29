//
//  LineaAtencionView.swift
//  RetoTC2007B
//

import SwiftUI
struct LineaAtencionView: View {
    
    @State var showView: Bool = false
    @State var editing: Bool = false
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ContactEntity.firstName, ascending: true)],
        animation: .default)
    
    private var Contacts: FetchedResults<ContactEntity>
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack{
                    ScrollView {
                        ForEach(Contacts, id: \.self){ contacto in
                            Button {
                                let phone = "tel://"
                                let phoneNumberformatted = phone + (contacto.phone ?? contacto.phone_wrapped)
                                guard let url = URL(string: phoneNumberformatted) else { return }
                                UIApplication.shared.open(url)
                            } label: {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 140)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                    HStack {
                                        VStack{
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                                .padding(.trailing, 95)
                                            Text(contacto.role ?? contacto.role_wrapped)
                                                .frame(width: 150, alignment: .leading)
                                                .font(Font.custom("Poppins-SemiBold", size: 15).bold())
                                            Text("\(contacto.firstName ?? contacto.firstName_wrapped) \(contacto.lastName ?? contacto.lastName_wrapped)")
                                                .frame(width: 150, alignment: .leading)
                                                .font(Font.custom("Apercu Light", size: 14))
                                            Text("\(contacto.phone ?? contacto.phone_wrapped)")
                                                .frame(width: 150, alignment: .leading)
                                                .font(Font.custom("Apercu Light", size: 14))
                                        }
                                        Spacer()
                                        VStack{
                                            if editing{
                                                Button{
                                                    deleteItem(ID: contacto.id!)
                                                }label:{
                                                    Image(systemName: "multiply.circle")
                                                        .resizable()
                                                        .frame(width: 28, height: 28)
                                                        .foregroundColor(Color("Button"))
                                                }
                                                Spacer()
                                            }
                                            Image(systemName: "phone.fill.arrow.up.right")
                                                .resizable()
                                                .frame(width: 35, height: 35)
                                        }.padding([.top, .bottom])
                                    }
                                    .frame(maxWidth: 300)
                                }
                            }
                            .foregroundColor(.black)
                        }
                        .padding(.top)
                        if editing{
                            Spacer()
                            Button {
                                deleteAll()
                            } label: {
                                Image(systemName: "trash.slash")
                                    .font(.system(size: 20))
                                    .foregroundColor(.red)
                            }
                        }
                        
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Línea")
                        .font(Font.custom("Poppins-SemiBold", size: 30))
                        .accessibilityAddTraits(.isHeader)
                        .fixedSize()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !editing{
                        Button {
                            editing.toggle()
                        } label: {
                            Image(systemName: "pencil.circle")
                                .font(.system(size: 30))
                                .fontWeight(.light)
                        }
                    }
                    if editing{
                        Button {
                            editing.toggle()
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .font(.system(size: 30))
                                .fontWeight(.light)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    if editing{
                        Button {
                            showView.toggle()
                        } label: {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 30))
                                .fontWeight(.light)
                        }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showView) {
            ContactsView()
        }
    }
    
    func deleteAll(){
        do {
            for item in Contacts {
                viewContext.delete(item)
            }
            // Save Changes
            try viewContext.save()
            
        } catch {
            // Error Handling
            // ...
        }
    }
    
    func deleteItem(ID: UUID){
        do {
            for item in Contacts {
                if item.id == ID{
                    viewContext.delete(item)
                }
            }
            // Save Changes
            try viewContext.save()
            
        } catch {
            // Error Handling
            // ...
        }
    }
}




struct LineaAtencionView_Previews: PreviewProvider {
    static var previews: some View {
        LineaAtencionView()
    }
}
