import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure GradedRing where
  group : Type u
  groupStr : AddCommGroup group
  grading : ℕ → Submodule ℤ group
  directSumDecomposition : DirectSum (fun n : ℕ => grading n) ≃+ group
  multiplicationGrading : ∀ (n m : ℕ) (x : grading n) (y : grading m), (x * y : group) ∈ grading (n + m)
  associativity : ∀ (x y z : group), x * (y * z) = (x * y) * z

structure GradedRingEvidence (G : GradedRing) where
  directSumDecompositionClosed : G.directSumDecomposition
  multiplicationGradingClosed : G.multiplicationGrading
  associativityClosed : G.associativity

def GradedRingClosed (G : GradedRing) : Prop := G.directSumDecomposition ∧ G.multiplicationGrading ∧ G.associativity

theorem graded_ring_closed_from_evidence (G : GradedRing) (E : GradedRingEvidence G) : GradedRingClosed G := by
  exact And.intro E.directSumDecompositionClosed (And.intro E.multiplicationGradingClosed E.associativityClosed)

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse