import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure GoodFiltration (R : FilteredRing A) [Ring A] (M : Type u) [Module A M] where
  filtration : ℕ → AddSubgroup M
  filtration_smul : ∀ n m : ℕ, R.filtration n • filtration m ⊆ filtration (n + m)
  associatedGraded : AssociatedGradedRing R
  associatedGradedModule : GradedModule (associatedGraded.gradedComponent) (λ n : ℕ => filtration n / filtration (n-1))
  finitelyGenerated : ∀ n : ℕ, Module.Finite (A ⧸ (R.filtration 0)) (filtration n / filtration (n-1))

structure GoodFiltrationEvidence (R : FilteredRing A) [Ring A] (M : Type u) [Module A M] (GF : GoodFiltration R M) where
  filtration_smul_closed : ∀ n m : ℕ, R.filtration n • GF.filtration m ⊆ GF.filtration (n + m)
  finitely_generated_closed : ∀ n : ℕ, Module.Finite (A ⧸ (R.filtration 0)) (GF.filtration n / GF.filtration (n-1))

def GoodFiltrationClosed (R : FilteredRing A) [Ring A] (M : Type u) [Module A M] (GF : GoodFiltration R M) : Prop :=
  (∀ n m : ℕ, R.filtration n • GF.filtration m ⊆ GF.filtration (n + m)) ∧
  (∀ n : ℕ, Module.Finite (A ⧸ (R.filtration 0)) (GF.filtration n / GF.filtration (n-1)))

theorem good_filtration_closed_from_evidence (R : FilteredRing A) [Ring A] (M : Type u) [Module A M] (GF : GoodFiltration R M) (E : GoodFiltrationEvidence R M GF) :
    GoodFiltrationClosed R M GF := by
  exact And.intro E.filtration_smul_closed E.finitely_generated_closed

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse