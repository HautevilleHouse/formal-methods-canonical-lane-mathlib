import HautevilleHouse.FormalMethodsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
