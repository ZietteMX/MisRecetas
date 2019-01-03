//
//  ReviewViewController.swift
//  Mis recetas
//
//  Created by MacMiniDev on 12/28/18.
//  Copyright © 2018 Ziette. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var ratingStackView: UIStackView!
    
    var imagenFondo : UIImage!
    
    var ratingSelected : String?
    @IBOutlet var firsButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImageView.image = self.imagenFondo
        //Efecto difuminado, como un filtro encima de la imagen original
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //Se esconde la stack o los botones para que aparezcan animados en el metodo viewDidAppear
        //let scalexy = ratingStackView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        //let translationxy = ratingStackView.transform = CGAffineTransform(translationX: 0.0, y: 500.0)
        
        //Concatenando las 2 constantes decalradas y comentadas arriba:
        //self.ratingStackView.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: 500.0).scaledBy(x: 0.0, y: 0.0)
        self.firsButton.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: 500.0).scaledBy(x: 0.0, y: 0.0)
        self.secondButton.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: 500.0).scaledBy(x: 0.0, y: 0.0)
        self.thirdButton.transform = CGAffineTransform.identity.translatedBy(x: 0.0, y: 500.0).scaledBy(x: 0.0, y: 0.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //se anima el elemento stackview
        /*UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
            self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)*/
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            self.firsButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: { (success) in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                self.secondButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: { (success) in
                UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
                    self.thirdButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
            })
            })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    
    @IBAction func ratingPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            ratingSelected = "dislike"
        case 2:
            ratingSelected = "good"
        case 3:
            ratingSelected = "great"
        default:
            break
        }
        
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
