//
//  ViewController.swift
//  FoodTracker
//
//  Created by Anna Bush on 5/1/19.
//  Copyright © 2019 ThinkEco Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks
        nameTextField.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    
    // called when user clicks "return/done" button in keyboard after entering text into text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hide the keyboard. This is like removing focus from the element in html
        textField.resignFirstResponder()
        
        // should system listen to Return key being pressed?
        return true
    }
    
    // called when text field resigns first responder status (in textFieldShouldReturn)
    func textFieldDidEndEditing(_ textField: UITextField) {
    }
    
    //MARK: UIImagePickerControllerDelegate
    
    // called when user clicks cancel on image picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    // called when user selects a photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage

        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    //MARK: Actions
    
    // called when photo tapped
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        // hide the keyboard in case text input was previously selected
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // shortened from UIImagePickerControllerSourceType.photoLibrary, because UIImagePickerControllerSourceType is inferred
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        // tell ViewController to "present" imagePickerController, with animation, and do nothing once it's presented
        present(imagePickerController, animated: true, completion: nil)

    }

}

