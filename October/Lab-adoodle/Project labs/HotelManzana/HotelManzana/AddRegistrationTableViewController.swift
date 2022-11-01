//
//  AddRegistrationTableViewController.swift
//  HotelManzana
//
//  Created by mac on 10/26/22.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegte {
  
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var checkinDetailLabelTextField: UILabel!
    
    @IBOutlet weak var checkoutDetailLabelTextField: UILabel!
    
    @IBOutlet weak var numberAdultsLabel: UILabel!
    @IBOutlet weak var numberAdultsStepper: UIStepper!
    @IBOutlet weak var childrenLabel: UILabel!
    @IBOutlet weak var childrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    
    
    
    let checkInDatePickerIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerIndexPath = IndexPath(row: 3, section: 1)
    
    let checkinDateLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkoutDateLabelIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckInDateVisible: Bool = false {
        didSet{
            checkInDatePicker.isHidden = !isCheckInDateVisible
        }
    }
    
    var isCheckOutDateVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDateVisible
        }
    }
    
    var roomType: RoomType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
    }

//     MARK: select rooms type deleagte methods
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    
    
    
    
    
    
    
  
    @IBAction func doneButtonTapped(_ sender: Any) {
        print("DONE TAPPED")
        print("First name: \(String(describing: firstNameTextField.text))")
        print("Last Name: \(String(describing: lastNameTextField.text))")
        print("Email: \(String(describing: emailTextField.text))")
        print("Check-In: \(checkInDatePicker.date)")
        print("Check-Out: \(checkOutDatePicker.date)")
        print("Number of adults: \(Int(numberAdultsStepper.value))")
        print("Number of Children: \(Int(childrenStepper.value))")
        print("wifi: \(wifiSwitch.isOn)")
    }
    
    
    func updateDateViews() {
        
        checkinDetailLabelTextField.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        checkoutDetailLabelTextField.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        updateDateViews()
    }
    
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
//        implament later
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerIndexPath where isCheckInDateVisible == false: return 0
        case checkOutDatePickerIndexPath where isCheckOutDateVisible == false: return 0
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerIndexPath: return 216
        case checkOutDatePickerIndexPath: return 216
        default: return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath == checkinDateLabelIndexPath && isCheckOutDateVisible == false {
            isCheckInDateVisible.toggle()
            
        } else if indexPath == checkoutDateLabelIndexPath && isCheckInDateVisible == false {
            isCheckOutDateVisible.toggle()
            
        } else if indexPath == checkinDateLabelIndexPath || indexPath == checkoutDateLabelIndexPath {
            isCheckInDateVisible.toggle()
            isCheckOutDateVisible.toggle()
        } else {
            return
        }
            
            
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func updateNumberOfGuests() {
        numberAdultsLabel.text = "\(Int(numberAdultsStepper.value))"
        childrenLabel.text = "\(Int(childrenStepper.value))"
    }
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "Not Set"
        }
    }
    
}
