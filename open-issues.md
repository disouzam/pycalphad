pycalphad - Open issues - Main page
---
- [pycalphad - Open issues](https://github.com/pycalphad/pycalphad/issues?page=1)

List of open issues:
---
1. [How to expose max_iterations, fixes convergence issues for our "larger" system #652](https://github.com/pycalphad/pycalphad/issues/652)
2. [Issue loading MSTDB v4.0 (.dat extension) #648](https://github.com/pycalphad/pycalphad/issues/648)
3. [Two-sub ionic liquid model for cation-neutral pairs #647](https://github.com/pycalphad/pycalphad/issues/647)
4. [Schiel solidification of multi-component aluminium alloys #641](https://github.com/pycalphad/pycalphad/issues/641)
5. [Better __repr__ for ModelComputedProperty and Jansson derivatives #607](https://github.com/pycalphad/pycalphad/issues/607)
6. [Computed properties for IsolatedPhase and other metaproperties do not expand wildcards #604](https://github.com/pycalphad/pycalphad/issues/604)
7. [Windows failures for test_model_pickle #601](https://github.com/pycalphad/pycalphad/issues/601)
8. [Oxygen Partial Pressure-Oxide Phase Fraction plotting and condition support #586](https://github.com/pycalphad/pycalphad/issues/586)
9. [StateVariable: display_units not preserved through pickle #557](https://github.com/pycalphad/pycalphad/issues/557)
   1.  The operation is easy to reproduce while the issue could not be easy to fix
   2.  But it is pretty clear what is happening: display units are changing when pickling / unpickling data
10. [StateVariable.__getitem__ implementation causes infinite loop when used in SymEngine matrix classes #547](https://github.com/pycalphad/pycalphad/issues/547)
11. [ChemSage DAT: extra tokens on the second line raises #542](https://github.com/pycalphad/pycalphad/issues/542)
12. [Database: parsing integer literals with leading zeros #455](https://github.com/pycalphad/pycalphad/issues/455)
13. [Bug with custom model calculating entropy #452](https://github.com/pycalphad/pycalphad/issues/452)
14. [Pseudobinary/ternary plotting and condition support #438](https://github.com/pycalphad/pycalphad/issues/438)
    1.  Related issue: ([Plotting arbitrary isopleths #5](https://github.com/pycalphad/pycalphad/issues/5))
    2.  Pseudo-components to behave like pure elements
    3.  plot() style interface
    4.  energy_surf routine
    5.  ConvexHull routine
    6.  Intersection of hyperplaces with convex hull
15. [Duplicate Species name error when parsing FactSage DAT into Database #425](https://github.com/pycalphad/pycalphad/issues/425)
    1.  There is already an open pull request since 2022: [FIX: ChemSage DAT: Case sensitivity of compound names in endmembers#426](https://github.com/pycalphad/pycalphad/pull/426)
    2.  It might be a good learning experience in managing these DAT file formats, also in the path of interest by Luís Otávio in issue  #413    3.
16. [write_tdb function outputs incorrect tdb due to symengine #420](https://github.com/pycalphad/pycalphad/issues/420)
    1. Related to issues with symengine - See [Fix exp(x + num)/exp(x) not evaluating #1828](https://github.com/symengine/symengine/pull/1828)
    2. Manipulation of expressions containing exponential and natural logarithm terms
    3. What is the actual case for writing back TDBs? Optimization?
    4. Appears to be already solved: [FIX: Preserve exponential functions in TDB roundtrip (issue pycalphad#420)](https://github.com/bocklund/pycalphad/commit/5e50a73fd1504125caae51b022acac65322621ff)
17. [ChemSage DAT support: Constituent parsing bug #419](https://github.com/pycalphad/pycalphad/issues/419)
18. [ChemSage DAT support: I2SL (SUBI) reading #418](https://github.com/pycalphad/pycalphad/issues/418)
19. [ChemSage DAT support: dummy phase hint and rejection #417](https://github.com/pycalphad/pycalphad/issues/417)
20. [ChemSage DAT support: DAT writing #413](https://github.com/pycalphad/pycalphad/issues/413)
    1.  What is Thermochimica?
    2.  Where DAT file enters in FactSage game?
    3.  Are all databases written in this format or only those that are created using FactSage and not encrypted?
    4.  There is already an open pull request by Max Poschmann at: [ENH: Implement writing of ChemSage DAT files
#422](https://github.com/pycalphad/pycalphad/pull/422)
1.  [MQMQA support: B-type excess mixing parameters #403](https://github.com/pycalphad/pycalphad/issues/403)
2.  [MQMQA support: overriding ternary extrapolations defined in the chemical groups #402](https://github.com/pycalphad/pycalphad/issues/402)
3.  [ChemSage DAT support: parsing heat capacity parameters #401](https://github.com/pycalphad/pycalphad/issues/401)
4.  [DOC/CI: Fix automatic website deployments #366](https://github.com/pycalphad/pycalphad/issues/366)
5.  [DOC: Improve dark mode support for images #356](https://github.com/pycalphad/pycalphad/issues/356)
6.  [Order-disorder model phase building/filtering error #345](https://github.com/pycalphad/pycalphad/issues/345)
7.  [DOC: regenerate examples and small fixes #321](https://github.com/pycalphad/pycalphad/issues/321)
    1.  It looks like a good opportunity to tackle existing examples that are relevant to pycalphad team members
    2.  A GitHub account of interest is [Materials Genome Foundation ](https://github.com/materialsgenomefoundation). One repository from this account is mentioned in issue 321: [[Calphad 2021] Update pycalphad agenda #6
](https://github.com/materialsgenomefoundation/workshop/issues/6)
1.  [BUG: Order/disorder model partitioning of physical properties in the Gibbs energy #318](https://github.com/pycalphad/pycalphad/issues/318)
2.  [BUG: unpack_condition puts (start, stop, step) tuples on half-open intervals #290](https://github.com/pycalphad/pycalphad/issues/290)
3.  [The parameter argument to _compute_phase_values does not accept None #284](https://github.com/pycalphad/pycalphad/issues/284)
4.  [v.X(component) = 1.0 conditions do not get numerically adjusted off the edge of composition space like v.X(component) = 0 conditions #279](https://github.com/pycalphad/pycalphad/issues/279)
5.  [Multi-line DATABASE_INFO #228](https://github.com/pycalphad/pycalphad/issues/228)
6.  [Refactor function arguments for components/species #226](https://github.com/pycalphad/pycalphad/issues/226)
7.  [Inconsistency in points argument of calculate #206](https://github.com/pycalphad/pycalphad/issues/206)
8.  [calculated values for sublattices with ternary cross interactions are not consistent with Thermo-Calc #179](https://github.com/pycalphad/pycalphad/issues/179)
9.  [[Feature request] Be able to pass conditions as arrays (disable broadcasting) #172](https://github.com/pycalphad/pycalphad/issues/172)
