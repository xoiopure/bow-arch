import Bow
import BowEffects
import SwiftUI

public typealias ComponentView<W: Comonad, M: Monad, V: View> = EffectComponentView<IOPartial<Error>, W, M, V>

// MARK: State-Store

public typealias StateTHandler<M: Monad, State> = EffectStateTHandler<IOPartial<Error>, M, State>
public typealias StateHandler<State> = EffectStateHandler<IOPartial<Error>, State>

public typealias StateTDispatcher<M: Monad, E, State, Input> = EffectStateTDispatcher<IOPartial<Error>, M, E, State, Input>
public typealias StateDispatcher<E, State, Input> = EffectStateDispatcher<IOPartial<Error>, E, State, Input>

//public typealias StoreTComponent<W: Comonad, M: Monad, S, I, V: View> = EffectStoreTComponent<IOPartial<Error>, W, M, S, I, V>
public typealias StoreComponent<E, S, I, V: View> = EffectStoreComponent<IOPartial<Error>, E, S, I, V>

// MARK: Writer-Traced

typealias WriterTHandler<M: Monad, State: Monoid> = EffectWriterTHandler<IOPartial<Error>, M, State>
typealias WriterHandler<State: Monoid> = EffectWriterHandler<IOPartial<Error>, State>

typealias WriterTDispatcher<M: Monad, E, State: Monoid, Input> = EffectWriterTDispatcher<IOPartial<Error>, M, E, State, Input>
typealias WriterDispatcher<Environment, E, State: Monoid, Input> = EffectWriterDispatcher<IOPartial<Error>, E, State, Input>

typealias TracedTComponent<W: Comonad, M: Monad, State: Monoid, V: View> = EffectTracedTComponent<IOPartial<Error>, W, M, State, V>
typealias TracedComponent<State: Monoid, I, V: View> = EffectTracedComponent<IOPartial<Error>, State, V>

// MARK: Action-Moore

typealias ActionHandler<Action> = EffectActionHandler<IOPartial<Error>, Action>

typealias ActionDispatcher<E, Action, Input> = EffectActionDispatcher<IOPartial<Error>, E, Action, Input>

typealias MooreComponent<Action, V: View> = EffectMooreComponent<IOPartial<Error>, Action, V>
