
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType) {
        self.emplpyeeType = employeeType
        employeeTypeLabel.textColor = .black
        employeeTypeLabel.text = employeeType.description
        updateSaveButtonState()
    }
    

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    var emplpyeeType: EmployeeType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        updateSaveButtonState()
        dobDatePicker.date = employee?.dateOfBirth ?? Date()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }

    var isEditingBirthday: Bool = false {
        didSet {
            dobDatePicker.isHidden = !isEditingBirthday
            tableView.beginUpdates()
            tableView.endUpdates()
            
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       if indexPath == IndexPath(row: 2, section: 0) && isEditingBirthday == false {
           return 0
       } else if indexPath == IndexPath(row: 2, section: 0) && isEditingBirthday == true {
           return 215
       } else {
           return UITableView.automaticDimension
       }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == IndexPath(row: 1, section: 0) {
            isEditingBirthday.toggle()
            dobLabel.textColor = .label
            dobLabel.text = dobDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        }
    }
    private func updateSaveButtonState() {
        let shouldEnableSaveButton = nameTextField.text?.isEmpty == false && emplpyeeType != nil
        saveBarButtonItem.isEnabled = shouldEnableSaveButton
    }
    
    
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
       let typeEmployeeController = EmployeeTypeTableViewController(coder: coder)
        typeEmployeeController?.delegate = self
        
        
        return typeEmployeeController
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let employeeType = emplpyeeType else {
            
            
            return
        }
        
        let employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: employeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }

    
    @IBAction func datePickerChanged(_ sender: Any) {
        dobLabel.text = dobDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
}
