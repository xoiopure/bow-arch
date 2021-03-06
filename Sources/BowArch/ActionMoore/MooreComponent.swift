import SwiftUI
import Bow
import BowEffects

typealias EffectMooreComponent<Eff: Async & UnsafeRun, Action, V: View> = EffectComponentView<Eff, MoorePartial<Action>, ActionPartial<Action>, V>

extension EffectMooreComponent {
//    init<E, A, S, I>(
//        initialState: S,
//        environment: E,
//        reducer: Reducer<S, A>,
//        render: @escaping (S, EffectActionHandler<Eff, A, I>) -> V)
//        where W == MoorePartial<A>,
//              M == ActionPartial<A> {
//        self.init(Moore.from(
//            initialState: initialState,
//            render: { state in
//                UI { send in
//                    render(state, EffectActionHandler(send))
//                }
//        },
//            update: reducer.run))
//    }
//    
//    init<A, S, I>(
//        initialState: S,
//        reducer: Reducer<S, A>,
//        render: @escaping (S, EffectActionHandler<Eff, A, I>) -> V)
//        where W == MoorePartial<A>,
//              M == ActionPartial<A> {
//        self.init(
//            initialState: initialState,
//            environment: (),
//            reducer: reducer,
//            render: render)
//    }
}

extension EffectMooreComponent {
    func moore<A>() -> Moore<A, UI<Eff, M, V>>
        where W == MoorePartial<A>,
              M == ActionPartial<A> {
        self.component.wui^
    }
}

//public extension EffectMooreComponent {
//    func lift<A, B, Input>(
//        _ handler: EffectActionHandler<Eff, B, Input>,
//        _ f: @escaping (A) -> B
//    ) -> EffectMooreComponent<Eff, A, V>
//        where W == MoorePartial<A>,
//              M == ActionPartial<A> {
//        EffectMooreComponent(self.component.lift(handler.focus(f)))
//    }
//}
