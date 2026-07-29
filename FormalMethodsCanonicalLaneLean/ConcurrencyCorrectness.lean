import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FormalMethodsCanonicalLaneLean

structure ConcurrencyCorrectnessPackage where
  sharedMemoryModel : Type
  linearizability : Prop
  deadlockFreedom : Prop
  lockFreedom : Prop
  linearizabilityTerm : linearizability
  deadlockFreedomTerm : deadlockFreedom
  lockFreedomTerm : lockFreedom

structure ConcurrencyCorrectnessEvidence (C : ConcurrencyCorrectnessPackage) where
  linearizabilityClosed : C.linearizability
  deadlockFreedomClosed : C.deadlockFreedom
  lockFreedomClosed : C.lockFreedom

def ConcurrencyCorrectnessClosed (C : ConcurrencyCorrectnessPackage) : Prop :=
  C.linearizability ∧ C.deadlockFreedom ∧ C.lockFreedom

theorem concurrency_correctness_closed_from_evidence
    (C : ConcurrencyCorrectnessPackage) (E : ConcurrencyCorrectnessEvidence C) :
    ConcurrencyCorrectnessClosed C := by
  exact And.intro E.linearizabilityClosed
    (And.intro E.deadlockFreedomClosed E.lockFreedomClosed)

end HautevilleHouse
end FormalMethodsCanonicalLaneLean