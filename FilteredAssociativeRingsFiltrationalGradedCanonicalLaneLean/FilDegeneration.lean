import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.FiltrationPackage
import HautevilleHouse.FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean.GradedRingPackage

/-!
# Fil Degeneration Package
-/

namespace HautevilleHouse
namespace FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean

structure FilDegenerationPackage {F : FiltrationPackage} {G : GradedRingPackage F} where
  degenerationMap : Type u
  surjectivity : Prop
  kernelCharacterization : Prop
  compatibilityWithGrading : Prop

structure FilDegenerationEvidence {F : FiltrationPackage} {G : GradedRingPackage F}
    (D : FilDegenerationPackage F G) where
  surjectivityClosed : D.surjectivity
  kernelCharacterizationClosed : D.kernelCharacterization
  compatibilityWithGradingClosed : D.compatibilityWithGrading

def FilDegenerationClosed {F : FiltrationPackage} {G : GradedRingPackage F}
    (D : FilDegenerationPackage F G) : Prop :=
  D.surjectivity ∧ D.kernelCharacterization ∧ D.compatibilityWithGrading

theorem fil_degeneration_closed_from_evidence
    {F : FiltrationPackage} {G : GradedRingPackage F}
    (D : FilDegenerationPackage F G) (E : FilDegenerationEvidence D) :
    FilDegenerationClosed D := by
  exact And.intro E.surjectivityClosed
    (And.intro E.kernelCharacterizationClosed E.compatibilityWithGradingClosed)

end FilteredAssociativeRingsFiltrationalGradedCanonicalLaneLean
end HautevilleHouse