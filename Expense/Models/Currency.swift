//
//  Currency.swift
//  Expense
//
//  Created by Егор Бадмаев on 13.07.2022.
//

/// Describes currencies of the `Account`. Defined with `@objc` to allow it to be used with `@NSManaged`.
@objc public enum Currency: Int32 {
    case eur, usd, rub, gbp, jpy, uah, kzt, byn, `try`, cny, czk, zly, inr
    
    /// Defines Unicode symbol of the currency
    var symbol: String {
        switch self {
        case .eur:
            return "€"
        case .usd:
            return "$"
        case .rub:
            return "₽"
        case .gbp:
            return "£"
        case .jpy:
            return "¥"
        case .uah:
            return "₴"
        case .kzt:
            return "₸"
        case .byn:
            return "₽"
        case .try:
            return "₤"
        case .cny:
            return "¥"
        case .czk:
            return "Kč"
        case .zly:
            return "zł"
        case .inr:
            return "₹"
        }
    }
    
    /// Defines letters by ISO 4217
    var letters: String {
        switch self {
        case .eur:
            return "EUR"
        case .usd:
            return "USD"
        case .rub:
            return "RUB"
        case .gbp:
            return "GBP"
        case .jpy:
            return "JPY"
        case .uah:
            return "UAH"
        case .kzt:
            return "KZT"
        case .byn:
            return "BYN"
        case .try:
            return "TRY"
        case .cny:
            return "CNY"
        case .czk:
            return "CZK"
        case .zly:
            return "PLN"
        case .inr:
            return "INR"
        }
    }
    
    /// Defines full name of the currency
    var name: String {
        switch self {
        case .eur:
            return "Euro"
        case .usd:
            return "Dollar"
        case .rub:
            return "Russian Ruble"
        case .gbp:
            return "Pound Sterling"
        case .jpy:
            return "Japanese Yen"
        case .uah:
            return "Ukrainian Hryvnia"
        case .kzt:
            return "Kazakhstani Tenge"
        case .byn:
            return "Belarusian Ruble"
        case .try:
            return "Turkish Lira"
        case .cny:
            return "Chinese Yuan"
        case .czk:
            return "Czech Koruna"
        case .zly:
            return "Poland Zloty"
        case .inr:
            return "Indian Rupee"
        }
    }
    
    /// Defines whether to put currency symbol in front or on the back of the number
    var isInFront: Bool {
        switch self {
        case .rub:
            return true
        case .byn:
            return true
        case .czk:
            return true
        case .zly:
            return true
        default:
            return false
        }
    }
    
    var placeholderSum: String {
        switch self {
        case .rub:
            return "100"
        case .byn:
            return "100"
        case .inr:
            return "100"
        case .jpy:
            return "200"
        case .kzt:
            return "500"
        default:
            return "10"
        }
    }
}
