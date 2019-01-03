//
//  DetailViewController.swift
//  Mis recetas
//
//  Created by MacMiniDev on 12/26/18.
//  Copyright © 2018 Ziette. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var recetaImageView: UIImageView!
    @IBOutlet var lblNombreRecete: UILabel!
    @IBOutlet var lblTiempoCoccion: UILabel!
    
    @IBOutlet var tableViewDetalle: UITableView!
    
    @IBOutlet var ratingButton: UIButton!
    
    var imagen : UIImage!
    var strNombreReceta : String!
    var strTiempoCoccion : String!
    
    var receta : Receta!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = receta.nombre
        //self.recetaImageView.image = self.receta.imagen
        self.recetaImageView.image = self.imagen
        self.lblNombreRecete.text = self.strNombreReceta
        self.lblTiempoCoccion.text = "Tiempo de cocción: \(self.strTiempoCoccion!) min."
        
        self.tableViewDetalle.backgroundColor = #colorLiteral(red: 0.6086366713, green: 0.8091620186, blue: 0.9686274529, alpha: 1)
        self.tableViewDetalle.tableFooterView = UIView(frame: CGRect.zero)
        self.tableViewDetalle.separatorColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        self.tableViewDetalle.estimatedRowHeight = 44.0
        self.tableViewDetalle.rowHeight = UITableView.automaticDimension
        
        //Aqui recupera la imagen seleccionada para el platillo
        let image = UIImage(named: self.receta.rating)
        self.ratingButton.setImage(image, for: .normal)
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

    @IBAction func closed(segue: UIStoryboardSegue)
    {
        if let reviewVC = segue.source as? ReviewViewController
        {
            if let ratingP = reviewVC.ratingSelected
            {
                self.receta.rating = ratingP
                let image = UIImage(named: self.receta.rating)
                self.ratingButton.setImage(image, for: .normal)
            }
        }
    }


}

extension DetailViewController : UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return self.receta.ingredientes.count
        case 2:
            return self.receta.pasosReceta.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "DetalleRecetaCell", for: indexPath) as! DetalleRecetaTableViewCell
        
        celda.backgroundColor = UIColor.clear
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                celda.keyLabel.text = "Nombre: "
                celda.valueLabel.text = strNombreReceta
            case 1:
                celda.keyLabel.text = "Tiempo: "
                celda.valueLabel.text = self.strTiempoCoccion
            /*case 2:
                celda.keyLabel.text = "Favorita: "
                celda.valueLabel.text = self.receta.isFavorito ? "Sí" : "No"
                /*if self.receta.isFavorito
                 {
                 celda.valueLabel.text = "Sí"
                 }
                 else
                 {
                 celda.valueLabel.text = "No"
                 }*/*/
            default:
                break
            }
        case 1:
            if indexPath.row == 0
            {
                celda.keyLabel.text = "Ingredientes: "
            }
            else
            {
                celda.keyLabel.text = ""
            }
            celda.valueLabel.text = self.receta.ingredientes[indexPath.row]
        case 2:
            if indexPath.row == 0
            {
                celda.keyLabel.text = "Pasos: "
            }
            else
            {
                celda.keyLabel.text = ""
            }
            celda.valueLabel.text = self.receta.pasosReceta[indexPath.row]
        default:
            break
        }
        
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titulo = ""
        
        switch section {
        case 1:
             titulo = "Ingredientes"
        case 2:
            titulo = "Pasos"
        default:
            break
        }
        
        return titulo
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReview"
        {
            let destinationViewController = segue.destination as! ReviewViewController
            destinationViewController.imagenFondo = self.imagen
        }
    }
}

extension DetailViewController : UITableViewDelegate
{
    
}
