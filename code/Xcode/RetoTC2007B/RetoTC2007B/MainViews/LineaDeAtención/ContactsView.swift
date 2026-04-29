//
//  ContactsView.swift
//  RetoTC2007B
//

import SwiftUI
import Contacts

struct ContactsView: View {
    
    @State var showView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State var contactos: [CNContact] = []
    @State var contacto: CNContact  = CNContact()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack{
                    ScrollView{
                        ForEach(contactos, id: \.self){ contacto in
                            Button {
                                self.contacto = contacto
                                showView.toggle()
                            }label: {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 350, height: 80)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                    HStack {
                                        Image(systemName: "person.fill")
                                            .font(.system(size: 30))
                                        Spacer()
                                        Text("\(contacto.givenName) \(contacto.familyName)")
                                            .frame(width: 150, alignment: .leading)
                                            .font(Font.custom("Apercu Light", size: 20))
                                        Spacer()
                                    }
                                    .frame(maxWidth: 300)
                                }
                            }
                            .foregroundColor(.black)
                        }
                        .padding(.vertical, 30)
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear{
                contactos.removeAll()
                Task.init{
                    await fetchAllContacts()
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Agregar contacto")
                        .font(Font.custom("Poppins-SemiBold", size: 30))
                        .accessibilityAddTraits(.isHeader)
                        .fixedSize()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image("BackButton")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                }
            }
            
        }
        .fullScreenCover(isPresented: $showView) {
            ContactDetailView(contacto: self.$contacto)
        }
    }
    
    func fetchAllContacts() async{
        let store = CNContactStore()
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        do{
            //Necesita permiso del usuario
            try store.enumerateContacts(with: fetchRequest, usingBlock: { contact, result in
                contactos.append(contact)
            })
        }
        catch{
            //Si el usuario no da permisos
            print("Error")
        }
    }
    
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
