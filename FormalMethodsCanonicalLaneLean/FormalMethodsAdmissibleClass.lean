import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure VerifiedSystem where
  model : Type
  property : model → Prop
  proven : ∀ (m : model), property m

structure FormalProofObject where
  system : VerifiedSystem
  specification : Prop
  proofComplete : specification

structure FormalAdmissibleObject where
  system : VerifiedSystem
  specification : Prop
  specificationSat : ∀ (m : system.model), system.property m → specification
  proofProvided : specificationSat
  conclusion : specification

def FormalWitnessClosed (O : FormalAdmissibleObject) : Prop :=
  O.specification

end FormalMethodsCanonicalLaneLean
end HautevilleHouse