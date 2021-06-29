//
//  ViewController.swift
//  CoredataDemo
//
//  Created by admin on 09/06/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let tableView:UITableView = {
       let table = UITableView()
        table.register(UITableViewCell
                        .self, forCellReuseIdentifier: "cell")
        return table
    }()
    

    private var models = [ToDoListitem]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreData To Do List"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        getAllItem()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        
    }
    
    @objc func didTapAdd (){
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            self.createItem(name:text)
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = models[indexPath.row]
        let sheet = UIAlertController(title: "Edit", message: "", preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.name
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self]_ in
                guard let field = alert.textFields?.first, let newname = field.text, !newname.isEmpty else {
                    return
                }
                self?.updateItems(item: item, newName: newname)
            }))
            self.present(alert, animated: true, completion: nil)
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self]_ in
            self?.deleteItem(item: item)
        }))
        present(sheet, animated: true, completion: nil)
    }
    
    func getAllItem(){
        do{
            models = try( context.fetch(ToDoListitem.fetchRequest()))
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    func createItem(name:String){
        let newItem = ToDoListitem(context: context)
        newItem.name = name
        newItem.createdAt = Date()
        do {
            try context.save()
            getAllItem()
        }catch{
            
        }
    }
    
    func deleteItem(item: ToDoListitem){
        context.delete(item)
        do {
            try context.save()
            getAllItem()
            
        }catch{
            
        }
    }
    func updateItems(item: ToDoListitem, newName:String){
        item.name = newName
        do {
            try context.save()
            getAllItem()
        }catch{
            
        }
    }
    
    
    
}

