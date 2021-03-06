import SwiftUI
import Bow
import BowEffects

public struct EffectComponentView<Eff: Async & UnsafeRun, W: Comonad, M: Monad, V: View>: View {
    @ObservedObject var component: EffectComponent<Eff, W, M, V>
    
    public init(_ component: EffectComponent<Eff, W, M, V>) {
        self.component = component
    }
    
    public var body: some View {
        component.explore(onEffect: { _ in Eff.lazy() })
    }
    
    public func onEffect(_ eff: @escaping (EffectComponent<Eff, W, M, V>) -> Kind<Eff, Void>) -> EffectComponentView<Eff, W, M, V> {
        EffectComponentView(component.onEffect(eff))
    }
    
    public func onEffectAction(_ eff: @escaping (EffectComponent<Eff, W, M, V>, Kind<M, Void>) -> Kind<Eff, Void>) -> EffectComponentView<Eff, W, M, V> {
        EffectComponentView(component.onEffectAction(eff))
    }
}
