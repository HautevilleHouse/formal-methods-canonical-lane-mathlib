import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure AdmissibleClass where
  object : FormalMethodsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FormalMethodsWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FormalMethodsCanonicalLaneLean
end HautevilleHouse
