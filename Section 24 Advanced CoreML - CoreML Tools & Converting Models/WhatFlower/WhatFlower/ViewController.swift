//
//  ViewController.swift
//  WhatFlower
//
//  Created by malakoipechyva on 4.01.21.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var imageView: UIImageView!
  
  let imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary
    imagePicker.allowsEditing = true
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      guard let ciImage = CIImage(image: userPickedImage) else {
        fatalError("converting ciimage error")
      }
      detect(image: ciImage)
      imageView.image = userPickedImage
      imagePicker.dismiss(animated: true, completion: nil)
    }
  }
  
  func detect(image: CIImage) {
    guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
      fatalError("cannot import model")
    }
    
    let request = VNCoreMLRequest(model: model) { (request, error) in
      let classification = request.results?.first as? VNClassificationObservation
      self.navigationItem.title = classification?.identifier
    }
    
    let handler = VNImageRequestHandler(ciImage: image)
    
    do {
      try handler.perform([request])
    }
    catch {
      print(error)
    }
  }

  @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
    present(imagePicker, animated: true, completion: nil)
  }
  
}

