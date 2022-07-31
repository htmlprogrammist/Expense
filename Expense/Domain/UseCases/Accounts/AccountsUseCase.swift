//
//  AccountsUseCase.swift
//  Expense
//
//  Created by Егор Бадмаев on 31.07.2022.
//

class AccountsUseCase {
    let accountsGateway: AccountsGatewayProtocol
    
    // MARK: - Init
    
    init(accountsGateway: AccountsGatewayProtocol) {
        self.accountsGateway = accountsGateway
    }
}
