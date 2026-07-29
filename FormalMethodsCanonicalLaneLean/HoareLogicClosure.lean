import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure HoareLogicPackage where
  programState : Type u
  precondition : Prop
  postcondition : Prop
  programSemantics : Prop
  partialCorrectnessEstablished : Prop
  totalCorrectnessEstablished : Prop

structure HoareLogicEvidence (H : HoareLogicPackage) where
  preconditionClosed : H.precondition
  postconditionClosed : H.postcondition
  partialCorrectnessEstablishedClosed : H.partialCorrectnessEstablished
  totalCorrectnessEstablishedClosed : H.totalCorrectnessEstablished

def HoareLogicClosed (H : HoareLogicPackage) : Prop :=
  H.precondition ∧ H.postcondition ∧
  H.partialCorrectnessEstablished ∧ H.totalCorrectnessEstablished

theorem hoare_logic_closed_from_evidence (H : HoareLogicPackage)
    (E : HoareLogicEvidence H) : HoareLogicClosed H := by
  exact And.intro E.preconditionClosed
    (And.intro E.postconditionClosed
      (And.intro E.partialCorrectnessEstablishedClosed
        E.totalCorrectnessEstablishedClosed))

end FormalMethodsCanonicalLaneLean
end HautevilleHouse