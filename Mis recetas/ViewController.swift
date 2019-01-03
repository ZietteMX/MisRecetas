//
//  ViewController.swift
//  Mis recetas
//
//  Created by MacMiniDev on 03/01/19.
//  Copyright © 2018 Ziette. All rights reserved...
//

import UIKit

class ViewController: UITableViewController {/* UIViewController, UITableViewDatasource, UITableViewDelegate*/
    
    var recipes : [Receta] = []    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        //navigationController?.hidesBarsOnSwipe = true
        // Do any additional setup after loading the view, typically from a nib.
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
                        tiempo: 25,
                        arrIngredientes: ["Pan para haburguesas","Tomate","Carne de res", "Aguacate", "Lechuga", "Mayonesa", "Queso amarillo", "Salsa picante"],
                        arrPasos: ["Se asa la carne al punto de la preferencia",
                                   "Se unta mayonesa al pan","Se añade al pan la carne y el resto de los ingredientes",
                                   "Se pone al carbòn hasta que este doradita"])
        recipes.append(recipe)
        
        recipe = Receta(name: "Torta de milanessa",
                        imagenReceta: #imageLiteral(resourceName: "torta"),
                        tiempo: 22,
                        arrIngredientes: ["Bolillo grande","frijoles","Milanesa","Aguacate", "Cebolla", "Jitomate", "Mayonesa", "Lechuga"],
                        arrPasos: ["Se asa la milanesa y se empaniza",
                                   "Se unta la mayonesa en el pan",
                                   "Se añade la carne cortada en trozos", "Se agrega el resto de los ingredientes al pan",
                                   "Se calienta la torta"])
        recipes.append(recipe)
        
        recipe = Receta(name: "Tacos dorados",
                        imagenReceta: #imageLiteral(resourceName: "tacos"),
                        tiempo: 35,
                        arrIngredientes: ["Tortillas","Pollo","Lechuga","Queso", "Crema", "Aceite", "Salsa picante"],
                        arrPasos: ["Se rellenan las tortillas de pollo","Se frien los tacos por 8 minutos",
                                   "Se añade encima de los tacaos la lechuga, crema, queso y salsa picante"])
        recipes.append(recipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
    
    //var recetas = ["Pizza de peperoni", "Hamburguesas al carbón", "Spaguetti a la bolognesa"]//para un modelo con diferentes campos no cabe en un array
    //MARK: - UITableViewDatasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "CeldaDeReceta"
        let celda = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! celdaDeReceta
        /*celda.textLabel?.text = recipe.nombre
        celda.imageView?.image = recipe.imagen*///Este código ya no aplica por que la celdaDeReceta ya esta configurada para trabajar con un imageView y 3 labels
        celda.imagen.image = recipe.imagen
        celda.nameLabel.text = recipe.nombre
        celda.TiempoCoccionLabel.text = "\(recipe.tiempoCocción!) min."
        var listaIngredientes = ""
        for i in 0..<recipe.ingredientes.count
        {
            if(i==(recipe.ingredientes.count-1))
            {
                listaIngredientes = listaIngredientes + recipe.ingredientes[i] + "."
            }
            else
            {
                listaIngredientes = listaIngredientes + recipe.ingredientes[i] + ", "
            }
        }
        celda.IngredientesLabel.text = "Ingredientes: \(listaIngredientes)"
        //print(listaIngredientes)
        
        /*celda.imagen.layer.cornerRadius = 51.0
        celda.imagen.clipsToBounds = true*/
        
        /*if recipe.isFavorito
        {
            celda.accessoryType = .checkmark
        }
        else
        {
            celda.accessoryType = .none
        }*/
        
        return celda
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {//permite hacer slide a la celda para borrar o agragar
        if editingStyle == .delete
        {
            self.recipes.remove(at: indexPath.row)//aqui se elimina loa receta seleccionada en el MODELO DE DATOS (clase Receta)
            
        }
        //self.tableView.reloadData()//aqui se actualizo la receta en la vista pero no es eficiente cuan do son muchos datos o filas
        self.tableView.deleteRows(at: [indexPath], with: .fade)//solo se actualiza el indespath seleccionado, no toda la tabla, es mas optimo que el reloaddata
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?//muestra una acción en respuesta al swipe echo en la celda
    {
        //Se agrega la opción de compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir en twitter") { (action, indexPath) in
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].nombre!) en la app de recetas echa en el curso de iOS 10"
            let activityontroller = UIActivityViewController(activityItems: [shareDefaultText, self.recipes[indexPath.row].imagen!], applicationActivities: nil)
            self.present(activityontroller, animated: true, completion: nil)
        }
        shareAction.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        //Sea grega la delete action para borrar como estaba antes
        let deleteAction = UITableViewRowAction(style: .default, title: "Eliminar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return [shareAction, deleteAction]
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //muestra el alert controller de favorito o no favorito
        /*let recipe = self.recipes[indexPath.row]
        //print("He seleccionadoi la fila \(indexPath.row)")
        let alerta = UIAlertController(title: recipe.nombre, message: "¿Es tu platillo favorito?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(cancelAction)
        
        var favoriteActionStyle = UIAlertAction.Style.default
        var favoriteTitulo = "Favorito"
        if recipe.isFavorito
        {
            favoriteTitulo = "No favorito"
            favoriteActionStyle = .destructive
        }
        
        let favoritAction = UIAlertAction(title: favoriteTitulo, style: favoriteActionStyle) { (accion) in
            //let recipe = self.recipes[indexPath.row]
            recipe.isFavorito = !recipe.isFavorito
            self.tableView.reloadData()
        }
        alerta.addAction(favoritAction)
        self.present(alerta, animated: true, completion: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecetaDetail"
        {
            if let indexx = self.tableView.indexPathForSelectedRow
            {
                let selectedReceta = self.recipes[indexx.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.imagen = selectedReceta.imagen
                destinationViewController.strNombreReceta = selectedReceta.nombre
                destinationViewController.strTiempoCoccion = String(format: "%i", selectedReceta.tiempoCocción)
                destinationViewController.receta = selectedReceta
            }
        }
    }
    
    
}

