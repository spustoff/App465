//
//  IncomeViewModel.swift
//  App465
//
//  Created by IGOR on 10/04/2024.
//

import SwiftUI
import CoreData

final class IncomeViewModel: ObservableObject {

    @AppStorage("AMI") var AMI: String = ""
    @Published var ami = ""
    @Published var isAMI: Bool = false

    @Published var incName: String = ""
    @Published var incAmount: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false

    @Published var incomes: [IncomeModel] = []
    @Published var selectedIncome: IncomeModel?
    
    func addIncome() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "IncomeModel", into: context) as! IncomeModel
        
        loan.incName = incName
        loan.incAmount = incAmount
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchIncomes() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<IncomeModel>(entityName: "IncomeModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.incomes = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.incomes = []
        }
    }

}

