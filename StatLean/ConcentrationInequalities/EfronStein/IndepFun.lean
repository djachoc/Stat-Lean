import StatLean.ConcentrationInequalities.EfronStein.Tensorization
import StatLean.ConcentrationInequalities.ForMathlib.IndepTransport

/-!
# The Efron–Stein inequality for independent random variables

This file exposes the product-space Efron–Stein inequality through the usual
`iIndepFun` interface. The proof transports the joint law of an independent family to
the product of its marginal laws, then applies `variance_le_efronSteinBound`.
-/

open MeasureTheory ProbabilityTheory

namespace StatLean.ConcentrationInequalities

variable {Ω : Type*} {mΩ : MeasurableSpace Ω} {P : Measure Ω}
  [IsProbabilityMeasure P]
  {ι : Type*} [Fintype ι] [DecidableEq ι]
  {𝓧 : ι → Type*} [∀ i, MeasurableSpace (𝓧 i)]

/-- **The Efron–Stein inequality for an independent family.** If `X i` are independent
random variables on `Ω`, the variance of `f(X)` is bounded by the canonical
Efron–Stein bound computed from their marginal laws. -/
theorem variance_le_efronSteinBound_of_iIndepFun
    {X : (i : ι) → Ω → 𝓧 i}
    (hX_meas : ∀ i, Measurable (X i))
    (hX_indep : iIndepFun X P)
    {f : (Π i, 𝓧 i) → ℝ}
    (hf_meas : Measurable f)
    (hf : MemLp (fun ω => f (fun i => X i ω)) 2 P) :
    Var[fun ω => f (fun i => X i ω); P]
      ≤ efronSteinBound (fun i => P.map (X i)) f := by
  let allX : Ω → (Π i, 𝓧 i) := fun ω i => X i ω
  have hallX_meas : Measurable allX := measurable_pi_lambda _ hX_meas
  have hmap : P.map allX = Measure.pi (fun i => P.map (X i)) :=
    (iIndepFun_iff_map_fun_eq_pi_map fun i => (hX_meas i).aemeasurable).mp hX_indep
  letI : ∀ i, IsProbabilityMeasure (P.map (X i)) := fun i =>
    Measure.isProbabilityMeasure_map (hX_meas i).aemeasurable
  have hf_pi : MemLp f 2 (Measure.pi fun i => P.map (X i)) := by
    rw [← hmap]
    exact (memLp_map_measure_iff hf_meas.aestronglyMeasurable hallX_meas.aemeasurable).mpr
      (by simpa [allX] using hf)
  have hbound := variance_le_efronSteinBound (fun i => P.map (X i)) hf_meas hf_pi
  rw [← hmap, variance_map hf_meas.aemeasurable hallX_meas.aemeasurable] at hbound
  simpa [allX] using hbound

end StatLean.ConcentrationInequalities
