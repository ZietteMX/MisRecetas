//
//  SingleViewController.swift
//  Mis recetas
//
//  Created by MacMiniDev on 12/19/18.
//  Copyright © 2018 Ziette. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController, UITableViewDelegate{

    @IBOutlet var tabla: UITableView!
    var recipes : [Receta] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tabla.dataSource = self
        self.tabla.delegate = self
        
        var recipe = Receta(name: "Pizza de queso",
                            imagenReceta: #imageLiteral(resourceName: "pizza"),
                            tiempo: 20,
                            arrIngredientes: ["Harina","Levadura","Sal", "Jugo de tomate", "Quesos", "Aceite", "Huevos"],
                            arrPasos: ["Se bate la harina con la levadura, aceite, sal y huevos hasta que quede una masa bien echa",
                                       "Se deja reposar la masa mas de 30 minutos",
                                       "Se extiende la masa en una bandeja y se añaden los demás ingredientes",
                                       "Se hornea durante 18 minutos"])
        recipes.append(recipe)
        
        recipe = Receta(name: "Hamburguesa al carbón",
                        imagenReceta: #imageLiteral(resourceName: "hamburguesa"),
                        tiempo: 20,
                        arrIngredientes: ["Pan para haburguesas","Tomate","Carne de res", "Aguacate", "Lechuga", "Mayonesa", "Queso amarillo", "Salsa picante"],
                        arrPasos: ["Se asa la carne al punto de la preferencia",
                                   "Se unta mayonesa al pan","Se añade al pan la carne y el resto de los ingredientes",
                                   "Se pone al carbòn hasta que este doradita"])
        recipes.append(recipe)
        
        recipe = Receta(name: "Torta de milanessa",
                        imagenReceta: #imageLiteral(resourceName: "torta"),
                        tiempo: 20,
                        arrIngredientes: ["Bolillo grande","frijoles","Milanesa","Aguacate", "Cebolla", "Jitomate", "Mayonesa", "Lechuga"],
                        arrPasos: ["Se asa la milanesa y se empaniza",
                                   "Se unta la mayonesa en el pan",
                                   "Se añade la carne cortada en trozos", "Se agrega el resto de los ingredientes al pan",
                                   "Se calienta la torta"])
        recipes.append(recipe)
        
        recipe = Receta(name: "Tacos dorados",
                        imagenReceta: #imageLiteral(resourceName: "tacos"),
                        tiempo: 20,
                        arrIngredientes: ["Tortillas","Pollo","Lechuga","Queso", "Crema", "Aceite", "Salsa picante"],
                        arrPasos: ["Se rellenan las tortillas de pollo","Se frien los tacos por 8 minutos",
                                   "Se añade encima de los tacaos la lechuga, crema, queso y salsa picante"])
        recipes.append(recipe)
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
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

extension SingleViewController: UITableViewDataSource//al poner esta extension, se debe de quitar UITableViewDataSource de hasta arriba en la definición de la clase ;)
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "CeldaDeReceta"
        let celda = self.tabla.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FullRecipeCell
        
        /*celda.textLabel?.text = recipe.nombre
        celda.imageView?.image = recipe.imagen*/
        
        celda.labelTitulo.text = recipe.nombre
        celda.imagenFull.image = recipe.imagen
        
        celda.labelTitulo.transform = CGAffineTransform(rotationAngle: .pi / -6)
        
        return celda
    }
}
