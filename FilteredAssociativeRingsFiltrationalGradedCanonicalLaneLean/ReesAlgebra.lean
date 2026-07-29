import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure ReesAlgebra (R : FilteredRing A) [Ring A] where
  reesRing : Type u
  reesRingInstRing : Ring reesRing
  grading : ℕ → AddSubgroup reesRing
  isomorphism : GradedRing grading ≃ AssociatedGradedRing R

structure ReesAlgebraEvidence (R : FilteredRing A) [Ring A] (RA : ReesAlgebra R) where
  isomorphism_closed : GradedRing (RA.grading) ≃ AssociatedGradedRing R

def ReesAlgebraClosed (R : FilteredRing A) [Ring A] (RA : ReesAlgebra R) : Prop :=
  GradedRing (RA.grading) ≃ AssociatedGradedRing R

theorem rees_algebra_closed_from_evidence (R : FilteredRing A) [Ring A] (RA : ReesAlgebra R) (E : ReesAlgebraEvidence R RA) :
    ReesAlgebraClosed R RA := by
  exact E.isomorphism_closed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse