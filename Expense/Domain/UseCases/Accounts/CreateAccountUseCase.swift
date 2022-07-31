//
//  CreateAccountUseCase.swift
//  Expense
//
//  Created by Егор Бадмаев on 30.07.2022.
//

protocol CreateAccountUseCaseProtocol {
    func createAccount(with data: AccountInfo)
}

final class CreateAccountUseCase: AccountsUseCase, CreateAccountUseCaseProtocol {
    func createAccount(with data: AccountInfo) {
        accountsGateway.createAccount(with: data)
    }
}
