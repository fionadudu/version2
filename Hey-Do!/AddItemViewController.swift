//
//  AddItemViewController.swift
//  Hey-Do!
//
//  Created by babykang on 15/5/14.
//  Copyright (c) 2015年 Fiona. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistModel)
    func addItemViewController(controller: AddItemViewController, didFinishEditingItem item: ChecklistModel)
}


class AddItemViewController: UITableViewController , UITextFieldDelegate{
    
    var itemToEdit : ChecklistModel?

    weak var delegate: AddItemViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
        }
        navigationController?.navigationBar.barTintColor = UIColor.brownColor()
        tableView.rowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        if let item = itemToEdit{
        item.text = textField.text
        delegate?.addItemViewController(self, didFinishEditingItem: item)
        }else{
            let item = ChecklistModel()
            item.text = textField.text
            item.checked = false
            delegate?.addItemViewController(self, didFinishAddingItem: item)
        }
        
    }

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneBarButtonItem: UIBarButtonItem!
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText: NSString = textField.text
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        if newText.length  > 0 {
            doneBarButtonItem.enabled = true
        }else{
            doneBarButtonItem.enabled = false
        }
        
        return true
    }
    
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
