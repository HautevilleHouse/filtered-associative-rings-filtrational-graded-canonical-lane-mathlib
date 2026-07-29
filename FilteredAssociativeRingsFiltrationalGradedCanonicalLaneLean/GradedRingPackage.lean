import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.FiltrationPackage

/-!
# Graded Ring Package
-/

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure GradedRingPackage (F : FiltrationPackage) where
  associatedGraded : ℕ → Type u
  additionGraded : ∀ n, associatedGraded n → associatedGraded n → associatedGraded n
  multiplicationGraded : ∀ m n, associatedGraded m → associatedGraded n → associatedGraded (m+n)
  zeroGraded : ∀ n, associatedGraded n
  oneGraded : associatedGraded 0
  gradedRingAxioms : Prop

structure GradedRingEvidence {F : FiltrationPackage} (G : GradedRingPackage F) where
  gradedRingAxiomsClosed : G.gradedRingAxioms

def GradedRingClosed {F : FiltrationPackage} (G : GradedRingPackage F) : Prop :=
  G.gradedRingAxioms

theorem graded_ring_closed_from_evidence {F : FiltrationPackage}
    (G : GradedRingPackage F) (E : GradedRingEvidence G) :
    GradedRingClosed G := by
  exact E.gradedRingAxiomsClosed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse