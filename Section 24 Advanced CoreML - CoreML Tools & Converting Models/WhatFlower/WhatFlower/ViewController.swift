//
//  ViewController.swift
//  WhatFlower
//
//  Created by malakoipechyva on 4.01.21.
//

import UIKit
import CoreML
import Vision
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var label: UILabel!
  
  let imagePicker = UIImagePickerController()
  
  let wikipediaURl = "https://en.wikipedia.org/w/api.php"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary
    imagePicker.allowsEditing = true
  }
  //MARK: - image picker
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
      guard let ciImage = CIImage(image: userPickedImage) else {
        fatalError("converting ciimage error")
      }
      detect(image: ciImage)
      
      imagePicker.dismiss(animated: true, completion: nil)
    }
  }
  //MARK: - Image detection function
  func detect(image: CIImage) {
    guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
      fatalError("cannot import model")
    }
    
    let request = VNCoreMLRequest(model: model) { (request, error) in
      guard let classification = request.results?.first as? VNClassificationObservation else {
        fatalError("classification error")
      }
      self.navigationItem.title = classification.identifier.capitalized
      self.requestInfo(flowerName: classification.identifier)
    }
    
    let handler = VNImageRequestHandler(ciImage: image)
    
    do {
      try handler.perform([request])
    }
    catch {
      print(error)
    }
  }
//MARK: - info request
  func requestInfo(flowerName: String) {
    
    let parameters : [String:String] = [
    "format" : "json",
    "action" : "query",
    "prop" : "extracts|pageimages",
    "exintro" : "",
    "explaintext" : "",
    "titles" : flowerName,
    "indexpageids" : "",
    "redirects" : "1",
      "pithumbsize" : "500"
    ]
    
    Alamofire.request(wikipediaURl, method: .get, parameters: parameters).responseJSON { (response) in
      if response.result.isSuccess {
        print("got info")
        let flowerJSON: JSON = JSON(response.result.value!)
        let pageid = flowerJSON["query"]["pageids"][0].stringValue
        let flowerDescription = flowerJSON["query"]["pages"][pageid]["extract"].stringValue
        let flowerImageUrl = flowerJSON["query"]["pages"][pageid]["thumbnail"]["source"].stringValue
        self.imageView.sd_setImage(with: URL(string: flowerImageUrl))
        
        self.label.text = flowerDescription
        
      }
    }
  }
  
  @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
    present(imagePicker, animated: true, completion: nil)
  }
  
}

