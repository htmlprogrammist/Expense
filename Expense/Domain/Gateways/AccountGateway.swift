//
//  AccountGateway.swift
//  Expense
//
//  Created by Егор Бадмаев on 31.07.2022.
//

protocol AccountsGatewayProtocol: AccountsCoreDataManagerProtocol {
}

final class AccountsGateway {
    
    let coreDataManager: AccountsCoreDataManagerProtocol
    
    // MARK: - Init
    
    init(coreDataManager: AccountsCoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
}

extension AccountsGateway: AccountsGatewayProtocol {
    
    func fetchAccounts() -> [Account]? {
        coreDataManager.fetchAccounts()
    }
    
    func createAccount(with data: AccountInfo) {
        coreDataManager.createAccount(with: data)
    }
    
    func update(_ account: Account, with data: AccountInfo) {
        coreDataManager.update(account, with: data)
    }
    
    func delete(_ account: Account) {
        coreDataManager.delete(account)
    }
}
