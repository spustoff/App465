//
//  AqcuiringViewModel.swift
//  App465
//
//  Created by IGOR on 09/04/2024.
//

import SwiftUI
import CoreData

final class AqcuiringViewModel: ObservableObject {

    @AppStorage("TB") var TB: String = ""
    @Published var tb = ""
    @Published var isAssTB: Bool = false
    
    @Published var currencies: [String] = ["EUR/USD", "GBP/USD", "AUD/USD", "USD/CAD", "USD/CHF", "NZD/USD"]
    @Published var cC = "EUR/USD"
    @AppStorage("currentCurrency") var currentCurrency = ""
    
    @Published var acquisitions = ""
    @Published var recieved = ""
    @AppStorage("TotalAcquisitions") var TotalAcquisitions: Int = 0
    @AppStorage("TotalRecieved") var TotalRecieved: Int = 0
    @Published var isAssTA: Bool = false
    @Published var isAssTR: Bool = false
    
    @AppStorage("expenses") var expenses: Int = 0
    @AppStorage("balance") var balance: Int = 0

    @Published var acAddress: String = ""
    @Published var acIncome: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isChart: Bool = false
    @Published var isDelete: Bool = false
    @Published var isEdit: Bool = false

    @Published var acquirings: [AcquiringModel] = []
    @Published var selectedAcquiring: AcquiringModel?
    
    func addsubAcquiring() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AcquiringModel", into: context) as! AcquiringModel
        
        loan.acAddress = acAddress
        loan.acIncome = acIncome
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchAcquirings() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AcquiringModel>(entityName: "AcquiringModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.acquirings = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.acquirings = []
        }
    }

}
