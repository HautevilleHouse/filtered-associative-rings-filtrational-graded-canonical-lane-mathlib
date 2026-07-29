import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FilteredRing (A : Type u) [Ring A] where
  filtration : ℕ → AddSubgroup A
  filtration_mul : ∀ m n : ℕ, filtration m * filtration n ⊆ filtration (m + n)
  contains_one : (1 : A) ∈ filtration 0

structure FilteredRingEvidence (R : FilteredRing A) [Ring A] where
  filtration_mul_closed : ∀ m n : ℕ, R.filtration m * R.filtration n ⊆ R.filtration (m + n)
  contains_one_closed : (1 : A) ∈ R.filtration 0

def FilteredRingClosed (R : FilteredRing A) [Ring A] : Prop :=
  (∀ m n : ℕ, R.filtration m * R.filtration n ⊆ R.filtration (m + n)) ∧
  ((1 : A) ∈ R.filtration 0)

theorem filtered_ring_closed_from_evidence (R : FilteredRing A) [Ring A] (E : FilteredRingEvidence R) :
    FilteredRingClosed R := by
  exact And.intro E.filtration_mul_closed E.contains_one_closed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse