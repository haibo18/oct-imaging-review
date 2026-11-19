/-!
# OCT 课题的形式化骨架（Lean 4，核心库，无 Mathlib）

本模块只机器核验论文中**可数值判定**的陈述：
1. OCT 发展关键年份先后顺序；
2. A 扫描（A-scan）速率从初期约 1 Hz 提升到商用约 100 kHz 的数量级；
3. 代表性工作波长（nm）与轴向分辨率（μm）记录；
4. OCT 技术代际的类型化定义。

光物理与临床结论以同行评审文献为准；本工程不把临床诊断命题
当作可由算术证明的陈述。
-/

namespace OctImaging

-- ======================================================================
-- 1. 发展时间线（年份：Nat）
-- ======================================================================

def year_first_demo : Nat := 1991        -- Huang/Fujimoto/Swanson 首次演示
def year_startup : Nat := 1992           -- AOD 创业公司成立
def year_first_commercial : Nat := 1996 -- Zeiss 首台商用 OCT
def year_lasker : Nat := 2023           -- Lasker-DeBakey 临床医学研究奖
def year_citation_laureate : Nat := 2026 -- Clarivate 引文桂冠

theorem chronology_ordered :
    year_first_demo < year_startup ∧
    year_startup < year_first_commercial ∧
    year_first_commercial < year_lasker ∧
    year_lasker < year_citation_laureate := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · decide
  · decide
  · decide
  · decide

-- ======================================================================
-- 2. A 扫描速率（Hz：Nat）
-- ======================================================================

/-- 初期时域 OCT 的 A-scan 重复率（约 0.8 Hz，取整为 1 Hz）。 -/
def earlyAscanHz : Nat := 1

/-- 现代商用谱域 / swept-source OCT 的 A-scan 重复率（约 100 kHz）。 -/
def clinicalAscanHz : Nat := 100_000

/-- 实验室原型 swept-source 的 A-scan 重复率（约 1 MHz）。 -/
def labAscanHz : Nat := 1_000_000

/-- 商用系统相对初期演示的速率提升倍数。 -/
theorem clinical_vs_early_speedup :
    clinicalAscanHz = 100_000 * earlyAscanHz := by
  decide

/-- 实验室原型相对初期演示的速率提升倍数。 -/
theorem lab_vs_early_speedup :
    labAscanHz = 1_000_000 * earlyAscanHz := by
  decide

/-- 实验室原型快于商用系统。 -/
theorem lab_faster_than_clinical :
    clinicalAscanHz < labAscanHz := by
  decide

-- ======================================================================
-- 3. 工作波长与轴向分辨率记录
-- ======================================================================

/-- 一台 OCT 系统的工作波长记录：名称、中心波长（nm）、轴向分辨率（μm）。 -/
structure OctSystem where
  name : String
  wavelengthNm : Nat
  axialResolutionUm : Nat

/-- 早期演示系统：~800 nm，轴向分辨率 ~10 μm。 -/
def earlyDemo : OctSystem := ⟨"time-domain demo", 800, 10⟩

/-- 现代眼科谱域 OCT：~840 nm，轴向分辨率 ~5 μm。 -/
def clinicalSdOCT : OctSystem := ⟨"spectral-domain ophthalmic", 840, 5⟩

/-- 深脉络膜 swept-source：~1050 nm。 -/
def deepSsOCT : OctSystem := ⟨"deep swept-source", 1050, 5⟩

/-- 冠脉内 OCT：~1310 nm。 -/
def cardiacOCT : OctSystem := ⟨"intracoronary", 1310, 10⟩

/-- 现代系统轴向分辨率优于早期演示。 -/
theorem modern_resolution_better_than_early :
    clinicalSdOCT.axialResolutionUm < earlyDemo.axialResolutionUm := by
  decide

/-- 波长记录按用途递增：眼科浅层 840 → 深层 1050 → 冠脉 1310。 -/
theorem wavelength_by_tissue_depth :
    clinicalSdOCT.wavelengthNm < deepSsOCT.wavelengthNm ∧
    deepSsOCT.wavelengthNm < cardiacOCT.wavelengthNm := by
  refine ⟨?_, ?_⟩
  · decide
  · decide

-- ======================================================================
-- 4. 技术代际
-- ======================================================================

/-- OCT 三代技术。 -/
inductive OctGen where
  | timeDomain      -- 第一代：时域 OCT，参考臂机械扫描
  | spectralDomain  -- 第二代：谱域 / Fourier-domain，CCD 并行探测
  | sweptSource     -- 第三代：扫频光源，高速成像

/-- 各代际的典型 A-scan 速率量级（Hz）。 -/
def typicalAscanHz : OctGen → Nat
  | .timeDomain => 1
  | .spectralDomain => 100_000
  | .sweptSource => 1_000_000

/-- 代际速率单调提升。 -/
theorem gen_speedup_chain :
    typicalAscanHz .timeDomain < typicalAscanHz .spectralDomain ∧
    typicalAscanHz .spectralDomain < typicalAscanHz .sweptSource := by
  refine ⟨?_, ?_⟩
  · decide
  · decide

-- ======================================================================
-- 5. 汇总
-- ======================================================================

theorem paper_evidence_summary :
    year_first_demo < year_citation_laureate ∧
    clinicalAscanHz = 100_000 * earlyAscanHz ∧
    clinicalSdOCT.axialResolutionUm < earlyDemo.axialResolutionUm ∧
    clinicalSdOCT.wavelengthNm < cardiacOCT.wavelengthNm := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · decide
  · exact clinical_vs_early_speedup
  · decide
  · decide

end OctImaging
