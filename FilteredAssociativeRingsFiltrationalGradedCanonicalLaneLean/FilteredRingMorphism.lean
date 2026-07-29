import canonicalLaneMathlib.AdmissibleClass
import FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.FilteredRing

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FilteredRingMorphism (R S : Type u) [Ring R] [Ring S]
    (FR : FilteredRing R) (FS : FilteredRing S) where
  map : R → S
  respects_filtration : ∀ i : ℕ, map '' (FR.filtration i : Set R) ⊆ (FS.filtration i : Set S)
  respects_mul : ∀ x y : R, map (x * y) = map x * map y
  respects_add : ∀ x y : R, map (x + y) = map x + map y
  respects_one : map 1 = 1

structure FilteredRingMorphismEvidence (R S : Type u) [Ring R] [Ring S]
    (FR : FilteredRing R) (FS : FilteredRing S) (φ : FilteredRingMorphism R S FR FS) where
  respects_filtration_closed : φ.respects_filtration
  respects_mul_closed : φ.respects_mul
  respects_add_closed : φ.respects_add
  respects_one_closed : φ.respects_one

def FilteredRingMorphismClosed (R S : Type u) [Ring R] [Ring S]
    (FR : FilteredRing R) (FS : FilteredRing S) (φ : FilteredRingMorphism R S FR FS) : Prop :=
  φ.respects_filtration ∧ φ.respects_mul ∧ φ.respects_add ∧ φ.respects_one

theorem filtered_ring_morphism_closed_from_evidence (R S : Type u) [Ring R] [Ring S]
    (FR : FilteredRing R) (FS : FilteredRing S) (φ : FilteredRingMorphism R S FR FS)
    (E : FilteredRingMorphismEvidence R S FR FS φ) : FilteredRingMorphismClosed R S FR FS φ := by
  exact And.intro E.respects_filtration_closed
    (And.intro E.respects_mul_closed
      (And.intro E.respects_add_closed E.respects_one_closed))

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse