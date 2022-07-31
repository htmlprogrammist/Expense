//
//  UpdateAccountUseCase.swift
//  Expense
//
//  Created by Егор Бадмаев on 31.07.2022.
//

protocol UpdateAccountUseCaseProtocol {
    func update(_ account: Account, with data: AccountInfo)
}

final class UpdateAccountUseCase: AccountsUseCase, UpdateAccountUseCaseProtocol {
    func update(_ account: Account, with data: AccountInfo) {
        accountsGateway.update(account, with: data)
    }
}
