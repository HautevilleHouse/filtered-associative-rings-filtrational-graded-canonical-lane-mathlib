import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure AssociatedGraded where
  filtration : FiltrationDefinition
  gradedRing : GradedRing
  isomorphism : gradation filtration.ring ≃+ gradedRing.group
  respectsMultiplication : ∀ (x y : filtration.ring), isomorphism (x * y) = isomorphism x * isomorphism y

structure AssociatedGradedEvidence (A : AssociatedGraded) where
  isomorphismClosed : A.isomorphism
  respectsMultiplicationClosed : A.respectsMultiplication

def AssociatedGradedClosed (A : AssociatedGraded) : Prop := A.isomorphism ∧ A.respectsMultiplication

theorem associated_graded_closed_from_evidence (A : AssociatedGraded) (E : AssociatedGradedEvidence A) : AssociatedGradedClosed A := by
  exact And.intro E.isomorphismClosed E.respectsMultiplicationClosed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse