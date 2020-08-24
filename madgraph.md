# Introduction

# Quick start

- Resources:
  - [ATLAS MG5@NLO](https://twiki.cern.ch/twiki/bin/view/AtlasProtected/MadGraph5aMCatNLOForAtlas)
  - [PID numbers](https://pdg.lbl.gov/2002/montecarlorpp.pdf)

# Examples

### 2HDMtypeII

Model can be downloaded [here](http://uaf-10.t2.ucsd.edu/~phchang/analysis/generator/fromMia/mgbasedir/). This will generated the $t\bar{t}H$ which $H$ is a CP-even odd Higgs boson with a higher mass than SM Higgs boson.

```
set group_subprocesses Auto
set ignore_six_quark_processes False
set loop_optimized_output True
set gauge unitary
set complex_mass_scheme False
import model sm
define p = g u c d s u~ c~ d~ s~
define wdec = e+ mu+ ta+ e- mu- ta- ve vm vt ve~ vm~ vt~ g u c d s b u~ c~ d~ s~ b~
import model 2HDMtypeII
generate p p > t t~ h2
output 2hdmtype_ttH
launch 2hdmtype_ttH
```
