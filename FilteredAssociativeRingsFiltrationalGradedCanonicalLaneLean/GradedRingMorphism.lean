import canonicalLaneMathlib.AdmissibleClass
import FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.GradedRing

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure GradedRingMorphism (R S : Type u) [Ring R] [Ring S]
    (GR : GradedRing R) (GS : GradedRing S) where
  map : R → S
  respects_grading : ∀ i : ℤ, map '' (GR.grading i : Set R) ⊆ (GS.grading i : Set S)
  respects_mul : ∀ x y : R, map (x * y) = map x * map y
  respects_add : ∀ x y : R, map (x + y) = map x + map y
  respects_one : map 1 = 1

structure GradedRingMorphismEvidence (R S : Type u) [Ring R] [Ring S]
    (GR : GradedRing R) (GS : GradedRing S) (φ : GradedRingMorphism R S GR GS) where
  respects_grading_closed : φ.respects_grading
  respects_mul_closed : φ.respects_mul
  respects_add_closed : φ.respects_add
  respects_one_closed : φ.respects_one

def GradedRingMorphismClosed (R S : Type u) [Ring R] [Ring S]
    (GR : GradedRing R) (GS : GradedRing S) (φ : GradedRingMorphism R S GR GS) : Prop :=
  φ.respects_grading ∧ φ.respects_mul ∧ φ.respects_add ∧ φ.respects_one

theorem graded_ring_morphism_closed_from_evidence (R S : Type u) [Ring R] [Ring S]
    (GR : GradedRing R) (GS : GradedRing S) (φ : GradedRingMorphism R S GR GS)
    (E : GradedRingMorphismEvidence R S GR GS φ) : GradedRingMorphismClosed R S GR GS φ := by
  exact And.intro E.respects_grading_closed
    (And.intro E.respects_mul_closed
      (And.intro E.respects_add_closed E.respects_one_closed))

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse