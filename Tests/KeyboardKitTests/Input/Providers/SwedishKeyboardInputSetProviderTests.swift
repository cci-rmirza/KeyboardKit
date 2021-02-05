//
//  SwedishKeyboardInputSetProviderTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import UIKit
@testable import KeyboardKit

class SwedishKeyboardInputSetProviderTests: QuickSpec {
    
    override func spec() {
        
        var device: MockDevice!
        var provider: KeyboardInputSetProvider!
        
        beforeEach {
            device = MockDevice()
            provider = SwedishKeyboardInputSetProvider(device: device)
        }
        
        describe("input set") {
            
            context("for phones") {
                
                beforeEach {
                    device.userInterfaceIdiomValue = .phone
                }
                
                it("has correct alphabetic input set") {
                    expect(provider.alphabeticInputSet().rows).to(equal([
                        "qwertyuiopå".chars,
                        "asdfghjklöä".chars,
                        "zxcvbnm".chars
                    ]))
                }
                
                it("has correct numeric input set") {
                    expect(provider.numericInputSet().rows).to(equal([
                        "1234567890".chars,
                        "-/:;()".chars + ["kr"] + "&@“".chars,
                        ".,?!’".chars
                    ]))
                }
                
                it("has correct symbolic input set") {
                    expect(provider.symbolicInputSet().rows).to(equal([
                        "[]{}#%^*+=".chars,
                        "_\\|~<>€$¥•".chars,
                        ".,?!’".chars
                    ]))
                }
            }
            
            context("for pads") {
                
                beforeEach {
                    device.userInterfaceIdiomValue = .pad
                }
                
                it("has correct alphabetic input set") {
                    expect(provider.alphabeticInputSet().rows).to(equal([
                        "qwertyuiopå".chars,
                        "asdfghjklöä".chars,
                        "zxcvbnm,.".chars
                    ]))
                }
                
                it("has correct numeric input set") {
                    expect(provider.numericInputSet().rows).to(equal([
                        "1234567890`".chars,
                        "@#".chars + ["kr"] + "&*()’”+•".chars,
                        "%_-=/;:,.".chars
                    ]))
                }
                
                it("has correct symbolic input set") {
                    expect(provider.symbolicInputSet().rows).to(equal([
                        "1234567890´".chars,
                        "€$£^[]{}—˚…".chars,
                        "§|~≠\\<>!?".chars
                    ]))
                }
            }
        }
    }
}