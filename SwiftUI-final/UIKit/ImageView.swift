//
//  ImageView.swift
//  SwiftUI-final
//
//  Created by 07 Zhang on 2020/6/13.
//  Copyright © 2020 07 Zhang. All rights reserved.
//

import SwiftUI
struct ImagePickerController:UIViewControllerRepresentable{
    @Binding var showselectPhoto:Bool
    @Binding var selectImage:Image
    
    func makeCoordinator() -> Coordinator {
        Coordinator(imagePickerController:self)
    }
    func makeUIViewController(context:UIViewControllerRepresentableContext<ImagePickerController>) ->UIImagePickerController{
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        controller.delegate = context.coordinator
        return controller
    }
    class Coordinator:NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        
        internal init(imagePickerController:ImagePickerController) {
            self.imagePickerController = imagePickerController
        }
        
        let imagePickerController: ImagePickerController
        
        func imagePickerController(_ picker:UIImagePickerController,didFinishPickingMediaWithInfo info:[
            UIImagePickerController.InfoKey:Any]) {
            if let uiImage = info[. originalImage ] as? UIImage { imagePickerController.selectImage = Image (uiImage: uiImage) }
            imagePickerController.showselectPhoto = false
        }
        
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
}
