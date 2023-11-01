//
//  ConsoleIO.swift
//  SeaFightGame
//
//  Created by m.grebenozhko on 29.10.2023.
//

import Foundation

enum OutputType {
  case error
  case standard
}

final class ConsoleIO {

    // MARK: - Public

    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Ошибка: \(message)\n", stderr)
        }
    }

    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8) ?? "Ошибка"
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
