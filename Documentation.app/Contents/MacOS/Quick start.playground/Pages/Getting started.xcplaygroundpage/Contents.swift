// nef:begin:header
/*
 layout: docs
 title: Getting started
 */
// nef:end
// nef:begin:hidden
import Bow
import BowArch
// nef:end
/*:
 # Getting started
 
 This is an overview of the steps you need to follow to create your first component in Bow Arch.
 
 ## 📦 Adding Bow Arch as a dependency
 
 Bow Arch is available through Swift Package Manager, integrated in Xcode. You only need to use the repository URL on GitHub and the version or branch you would like to use. Alternatively, you can describe this dependency in your `Package.swift` file by adding the line:
 
 ```swift
 .package(url: "https://github.com/bow-swift/bow-arch.git", from: "{version}")
 ```
 
 ## 📋 State
 
 Bow Arch lets you architect your application in terms of components that can be reused across applications. Let's go over what you need to create in order to build a stepper component.
 
 A component should have a state that is rendered in its view. State is usually modeled using an immutable data structure, typically a `struct`.
 
 For our stepper component, we can model our state as:
 */
struct StepperState {
    let count: Int
}
/*:
 ## 📲 Input
 
 Next step is modeling inputs that a component can handle. Inputs are usually described using cases of an `enum`.
 
 In our ongoing example, the component can receive two inputs, corresponding to tapping on the decrement or increment buttons. These can be modeled as:
 */
enum StepperInput {
    case tapDecrement
    case tapIncrement
}
/*:
 ## 🎨 View
 
 With state and input defined, we can render a view using SwiftUI. SwiftUI is a declarative framework to describe user interfaces in Swift, with multiple bindings for the different operating systems in the Apple Platforms.
 
 We can describe the view as a function of its state, and use a function to receive inputs:
 */
import SwiftUI

struct StepperView: View {
    let state: StepperState
    let handle: (StepperInput) -> Void
    
    var body: some View {
        HStack {
            Button("-") {
                self.handle(.tapDecrement)
            }
            
            Text("\(state.count)")
            
            Button("+") {
                self.handle(.tapIncrement)
            }
        }
    }
}
/*:
 ## 🔨 Dispatcher
 
 Inputs new to be transformed into actions that modify the state. This is done at the Dispatcher. Dispatchers are pure functions that receive inputs and produce actions:
 */
typealias StepperDispatcher = StateDispatcher<Any, StepperState, StepperInput>

let stepperDispatcher = StepperDispatcher.pure { input in
    switch input {
    case .tapDecrement:
        return .modify { state in
            StepperState(count: state.count - 1)
        }^
    
    case .tapIncrement:
        return .modify { state in
            StepperState(count: state.count + 1)
        }^
    }
}
/*:
 ## 🧩 Component
 
 Finally, we can put everything together as a component:
 */
typealias StepperComponent = StoreComponent<Any, StepperState, StepperInput, StepperView>

let stepperComponent = StepperComponent(
    initialState: StepperState(count: 0),
    dispatcher: stepperDispatcher,
    render: StepperView.init)
/*:
 Components already conform to SwiftUI `View`, so they can be used as part of other views, or assigned as the root view of a `UIHostingController`.
 
 This is a quick walkthrough of the main concepts used in the library. There is more to each of them; refer to each specific documentation page to learn more about them.
 */
