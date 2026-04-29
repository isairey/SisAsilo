//
//  MiEspacioView.swift
//  RetoTC2007B
//

import SwiftUI
import CoreData

struct MiEspacioView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ImageEntity.id, ascending: true),
            NSSortDescriptor(keyPath: \ImageEntity.name, ascending: true),
            NSSortDescriptor(keyPath: \ImageEntity.imageD, ascending: true)
        ],
        animation: .default)
    
    private var imagesDB: FetchedResults<ImageEntity>
    
    @State private var image: Data = .init(count: 0)
    @State private var show: Bool = false
    @State var editing: Bool = false

    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Color("Background")
                    .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(imagesDB, id: \.id) { save in
                        
                        VStack {
                            
                            ZStack{
                                NavigationLink(destination: ShowImageView(image: save.imageD!)) {
                                    Image(uiImage: UIImage(data: save.imageD ?? self.image)!)
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width - 28, height: 200)
                                        .cornerRadius(20)
                                        .shadow(radius: 8)
                                }
                                .disabled(editing)

                                if editing{
                                    Button{
                                        deleteItem(ID: save.id!)
                                    }label:{
                                        Image(systemName: "multiply.circle")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(Color(.red))
                                    }
                                }
                            }
                            Text(save.name!)
                        }
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
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Mi espacio")
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
                                self.show.toggle()
                            } label: {
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 30))
                                    .fontWeight(.light)
                            }
                        }
                    }
                }
                
            }
        }
        .sheet(isPresented: self.$show) {
            AddInfo()
                .environment(\.managedObjectContext, self.viewContext)
        }
    }

    func deleteAll(){
        do {
            for image in imagesDB {
                viewContext.delete(image)
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
            for img in imagesDB {
                if img.id == ID{
                    viewContext.delete(img)
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

struct MiEspacioView_Previews: PreviewProvider {
    static var previews: some View {
        MiEspacioView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct AddInfo: View {
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var image: Data = .init(count: 0)
    @State private var show: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                if self.image.count != 0 {
                    
                    Button {
                        self.show.toggle()
                        // Call the imagepicker
                    } label: {
                        Image(uiImage: UIImage(data: self.image)!)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(20)
//                            .shadow(radius: 8)
                    }
                } else {
                    
                    Button {
                        self.show.toggle()
                        // Call the imagepicker
                    } label: {
                        Image(systemName: "photo.fill")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(20)
//                            .shadow(radius: 8)
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                
                TextField("Nombre de foto", text: self.$name)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(15)
                
                Button {
                    let save = ImageEntity(context: self.moc)
                    save.id = UUID()
                    save.imageD = self.image
                    save.name = self.name
                    
                    // salvamos los datos
                    
                    try! self.moc.save()
                    
                    self.name = ""
                    
                    dismiss()
                    
                } label: {
                    Text("Guardar")
                }
                
            }
        }
        .sheet(isPresented: self.$show) {
            ImagePicker(images: self.$image, show: $show)
        }
        
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var images: Data
    @Binding var show: Bool
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(img1: self)
    }
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var img0 : ImagePicker
        init(img1: ImagePicker) {
            img0 = img1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.img0.show.toggle()
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            let image = info[.originalImage] as? UIImage
            
            let data = image?.jpegData(compressionQuality: 0.50)
            print(data!)
            self.img0.images = data!
            self.img0.show.toggle()
            // Tras conseguir la imagen, hacemos toggle al show para salir del imagePicker
            
        }
        
    }
    
}


//        NavigationView {
//
//            ZStack {
//                Color("Background")
//                    .ignoresSafeArea()
//
//                ScrollView {
//
////
////                    if images != nil {
////                        LazyVGrid(columns: columns) {
////
////                            ForEach(images!, id: \.self) { image in
////
////                                Button {
////                                    print("Mostrar o editar foto")
////                                } label: {
////                                    Image(uiImage: image)
////                                        .scaledToFit()
////                                        .cornerRadius(20)
////                                        .frame(width: 200, height: 200)
////                                }
////
////                            }
////                        }
////                        .padding([.horizontal, .top])
////                    }
//                }
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .principal) {
//                        Text("Mi espacio")
//                            .font(Font.custom("Poppins-SemiBold", size: 30))
//                            .accessibilityAddTraits(.isHeader)
//                            .fixedSize()
//                    }
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        Button {
//                            print("Agregar Foto")
//                        } label: {
//                            Image(systemName: "plus.circle")
//                                .font(.system(size: 20))
//                                .foregroundColor(.black)
//                        }
//                    }
//                }
//
//            }
//
//        }
