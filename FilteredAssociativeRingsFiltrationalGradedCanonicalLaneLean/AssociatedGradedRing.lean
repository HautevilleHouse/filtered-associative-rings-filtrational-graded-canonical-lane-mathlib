import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure AssociatedGradedRing (R : FilteredRing A) [Ring A] where
  gradedComponent : ℕ → Type u
  gradedRing : GradedRing gradedComponent
  associatedMap : ∀ n : ℕ, R.filtration n / R.filtration (n-1) → gradedComponent n
  bijectivity : ∀ n : ℕ, Function.Bijective (associatedMap n)

structure AssociatedGradedRingEvidence (R : FilteredRing A) [Ring A] (G : AssociatedGradedRing R) where
  bijectivity_closed : ∀ n : ℕ, Function.Bijective (G.associatedMap n)

def AssociatedGradedRingClosed (R : FilteredRing A) [Ring A] (G : AssociatedGradedRing R) : Prop :=
  ∀ n : ℕ, Function.Bijective (G.associatedMap n)

theorem associated_graded_ring_closed_from_evidence (R : FilteredRing A) [Ring A] (G : AssociatedGradedRing R) (E : AssociatedGradedRingEvidence R G) :
    AssociatedGradedRingClosed R G := by
  exact E.bijectivity_closed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse