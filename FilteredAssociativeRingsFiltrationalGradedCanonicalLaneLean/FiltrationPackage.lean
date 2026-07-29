import canonicalLaneMathlib.AdmissibleClass

/-!
# Filtration Package
-/

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FiltrationPackage where
  ringType : Type u
  filtration : ℕ → Set ringType
  filtrationContainsZero : ∀ n, (0 : ringType) ∈ filtration n
  filtrationContainsOne : (1 : ringType) ∈ filtration 0
  filtrationAdd : ∀ n, ∀ a b, a ∈ filtration n → b ∈ filtration n → a + b ∈ filtration n
  filtrationMul : ∀ m n, ∀ a b, a ∈ filtration m → b ∈ filtration n → a*b ∈ filtration (m+n)
  filtrationDecreasing : ∀ n, filtration (n+1) ⊆ filtration n

structure FiltrationEvidence (F : FiltrationPackage) where
  filtrationContainsZeroClosed : F.filtrationContainsZero
  filtrationContainsOneClosed : F.filtrationContainsOne
  filtrationAddClosed : F.filtrationAdd
  filtrationMulClosed : F.filtrationMul
  filtrationDecreasingClosed : F.filtrationDecreasing

def FiltrationClosed (F : FiltrationPackage) : Prop :=
  F.filtrationContainsZero ∧ F.filtrationContainsOne ∧
  F.filtrationAdd ∧ F.filtrationMul ∧ F.filtrationDecreasing

theorem filtration_closed_from_evidence (F : FiltrationPackage) (E : FiltrationEvidence F) :
    FiltrationClosed F := by
  exact And.intro E.filtrationContainsZeroClosed
    (And.intro E.filtrationContainsOneClosed
      (And.intro E.filtrationAddClosed
        (And.intro E.filtrationMulClosed E.filtrationDecreasingClosed)))

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse