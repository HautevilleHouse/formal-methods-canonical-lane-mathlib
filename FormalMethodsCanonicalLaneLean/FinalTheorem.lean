import HautevilleHouse.FormalMethodsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

def ConstrainedFormalMethodsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_formal_methods_endgame (A : AdmissibleClass) :
    ConstrainedFormalMethodsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
