//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by hwanghye on 5/26/24.
//

import UIKit

struct Todo {
    var title: String
    var isChecked: Bool
}



class TodoListTableViewController: UITableViewController {
    
    // Outlet
    @IBOutlet var titleNavigation: UINavigationItem!
    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var addTodoButton: UIButton!
    
    //  변수
    var todoList: [Todo] = []
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        titleNavigation.title = "TODO LIST"
        
        todoTextField.layer.borderWidth = 1
        todoTextField.layer.borderColor = UIColor.black.cgColor
        todoTextField.layer.cornerRadius = 8
        todoTextField.placeholder = "해야할 일을 적어보세요"
        
        addTodoButton.setTitle("추가하기", for: .normal)
        addTodoButton.tintColor = .white
        addTodoButton.backgroundColor = .black
        addTodoButton.layer.cornerRadius = 8


        tableView.rowHeight = 50
        
    }
    
    
    // Cell의 갯수 설정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoList.count
    }
    
    
    // Cell의 내용 설정
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoTableViewCell", for: indexPath) as! TodoTableViewCell
        let data = todoList[indexPath.row]
        
        
        cell.todoCheckButton.tintColor = .black
        cell.todoListLabel?.text = data.title

        
        if data.isChecked {
            let image = UIImage(systemName: "checkmark.square")
            cell.todoCheckButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(systemName: "square")
            
            
            cell.todoCheckButton.setImage(image, for: .normal)
            cell.todoCheckButton.tag = indexPath.row
            cell.todoCheckButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
            
        }

        return cell
    }
    
    
    // Cell Remove
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        todoList.remove(at: indexPath.row)
        
        tableView.reloadData()
        
    }
    
    
    // addTodoButton Action
    @IBAction func todoButtonClicked(_ sender: UIButton) {
        
        // action: add Button 누르면
        // if true: TextField 글자가 1자 이상일 때, todoList에 append
        // else alert "해야할 일을 입력해주세요"
        
        guard let text = todoTextField.text, text.count > 1 else {
            
            showAlert(message: "해야할 일을 입력해주세요")
            
            return
            
            }
    
        let newTodo = Todo(title: text, isChecked: false)
        todoList.append(newTodo)
        todoTextField.text = ""
        
        tableView.reloadData()
        
    }
    
    
    // TextField Alert
    func showAlert(message: String) {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    
    
    // Checkbox Button Clicked Action
    @objc
    func checkButtonClicked(sender: UIButton) {
        
        todoList[sender.tag].isChecked.toggle()
        
        // change된 cell만 reload
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
        // tableView.reloadData()

        print(sender.tag)
        
    }
    
}
