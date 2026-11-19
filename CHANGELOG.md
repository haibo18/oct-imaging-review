# Changelog

本仓库所有显著变更均记录于此。格式遵循
[Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [Semantic Versioning](https://semver.org/lang/zh-CN/)。

## [0.1.0] - 2026-11-20

### Added

- 综述论文 `paper/oct_imaging_review.md`：OCT 低相干干涉测量原理、三代技术演进
  （时域 → 谱域 → 扫频光源）、关键性能数据、临床与产业影响、未决问题与
  科学奖项潜质评估。
- Lean 4 形式化工程 `OctImaging/`（工具链 `leanprover/lean4:v4.36.0`，核心库）：
  - 时间线年份链 `chronology_ordered`（1991/1992/1996/2023/2026）；
  - A-scan 速率定义与提升倍数命题 `clinical_vs_early_speedup`、
    `lab_vs_early_speedup`、`lab_faster_than_clinical`；
  - 系统记录 `OctSystem` 与波长/分辨率命题 `modern_resolution_better_than_early`、
    `wavelength_by_tissue_depth`；
  - 技术代际 `OctGen` 与速率链 `gen_speedup_chain`；
  - 汇总命题 `paper_evidence_summary`。
- GitHub Actions Lean CI（`leanprover/lean-action`）。
- 仓库说明 `README.md` 与本变更日志。

### Verification

- `lake build`：`Build completed successfully`，`errors=0`，`warnings=0`。
- `sorry` / `admit` / `axiom`：0 处。
