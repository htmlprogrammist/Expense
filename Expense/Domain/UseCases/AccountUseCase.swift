//
//  AccountUseCase.swift
//  Expense
//
//  Created by Егор Бадмаев on 30.07.2022.
//

final class AccountUseCase {
    let coreDataManager: AccountsCoreDataManagerProtocol
    
    // MARK: - Init
    
    init(coreDataManager: AccountsCoreDataManagerProtocol) {
        self.coreDataManager = coreDataManager
    }
}
