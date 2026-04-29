//
//  ContactDetailView.swift
//  RetoTC2007B
//

import SwiftUI
import Contacts

struct ContactDetailView: View {
    
    @Binding var contacto: CNContact
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext
    @State var numSelec: String = ""
    @State var role: String = ""
    @State private var presentAlert = false
    @State private var numSelected = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("Background")
                    .ignoresSafeArea()
                VStack{
                    Text("\(contacto.givenName) \(contacto.familyName)")
                        .font(Font.custom("Poppins-SemiBold", size: 30))
                        .accessibilityAddTraits(.isHeader)
                        .fixedSize()
                    Text("Selecciona el número a agregar:")
                        .font(Font.custom("Apercu Light", size: 20))
                        .fixedSize()
                        .padding(.vertical)
                    ForEach(contacto.phoneNumbers, id: \.self){ number in
                        switch number.label{
                        case CNLabelPhoneNumberMobile:
                            Text("Movil: \(number.value.stringValue)")
                                .font(Font.custom("Poppins-SemiBold", size: 18))
                                .accessibilityAddTraits(.isHeader)
                                .fixedSize()
                                .padding(.bottom)
                                .opacity(numSelec == number.value.stringValue ? 1.0 : 0.3)
                                .onTapGesture {
                                    numSelec = number.value.stringValue
                                    numSelected = true
                                }
                        case CNLabelPhoneNumberiPhone:
                            Text("iPhone: \(number.value.stringValue)")
                                .font(Font.custom("Poppins-SemiBold", size: 18))
                                .accessibilityAddTraits(.isHeader)
                                .fixedSize()
                                .padding(.bottom)
                                .opacity(numSelec == number.value.stringValue ? 1.0 : 0.3)
                                .onTapGesture {
                                    numSelec = number.value.stringValue
                                    numSelected = true
                                }
                        case CNLabelPhoneNumberMain:
                            Text("Principal: \(number.value.stringValue)")
                                .font(Font.custom("Poppins-SemiBold", size: 18))
                                .accessibilityAddTraits(.isHeader)
                                .fixedSize()
                                .padding(.bottom)
                                .opacity(numSelec == number.value.stringValue ? 1.0 : 0.3)
                                .onTapGesture {
                                    numSelec = number.value.stringValue
                                    numSelected = true
                                }
                        default:
                            Text("Otro: \(number.value.stringValue)")
                                .font(Font.custom("Poppins-SemiBold", size: 18))
                                .accessibilityAddTraits(.isHeader)
                                .fixedSize()
                                .padding(.bottom)
                                .opacity(numSelec == number.value.stringValue ? 1.0 : 0.3)
                                .onTapGesture {
                                    numSelec = number.value.stringValue
                                    numSelected = true
                                }
                        }
                    }
                    Button{
                        if numSelected {
                            presentAlert = true
                        } else {
                            presentAlert = false
                        }
                    }label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 50))
                            .foregroundColor(.black)
                    }
                    .alert("Rol", isPresented: $presentAlert, actions: {
                        TextField("Rol", text: $role)
                        Button("Agregar", action: {
                            withAnimation {
                                let newContact = ContactEntity(context: viewContext)
                                newContact.id = UUID()
                                newContact.firstName = contacto.givenName
                                newContact.lastName = contacto.familyName
                                newContact.phone = numSelec
                                newContact.role = role
                                do {
                                    try viewContext.save()
                                } catch {
                                    let nsError = error as NSError
                                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                                }
                            }
                            presentationMode.wrappedValue.dismiss()
                        })
                        Button("Cancelar", role: .cancel, action: {
                            presentAlert = false
                        })
                    }, message: {
                        Text("Define el rol de este contacto")
                    })
                    .padding(.vertical)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Agregar a \(contacto.givenName)")
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
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var cont: CNContact  = CNContact()
    static var previews: some View {
        ContactDetailView(contacto: .constant(cont))
    }
}
