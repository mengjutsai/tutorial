# Introduction
Uproot tutorial: https://masonproffitt.github.io/uproot-tutorial/aio.html



```python
import numpy as np
import pandas as pd

# The wierd zero problem is fixed with uproot4: https://github.com/scikit-hep/uproot/issues/513
# Therefore, we don't need to use uproot3
import uproot4
import uproot
import math
import time
import timeit

import xgboost as xgb

# First XGBoost model for Pima Indians dataset
from numpy import loadtxt
from xgboost import XGBClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn.metrics import roc_curve,roc_auc_score,auc #算auc用

import matplotlib.pyplot as plt
from tqdm import tqdm
import random
```


```python
from random import randrange
from random import randint

x = [randint(1, 8) for p in range(0, 10)]
print(x)
```

    [7, 8, 7, 4, 3, 2, 6, 3, 8, 4]


# Validation on the random
random integer with step: https://stackoverflow.com/questions/3996904/generate-random-integers-between-0-and-9
count occurance of elements in array: https://stackoverflow.com/questions/21866625/counting-occurrences-of-items-in-an-array-python


```python
a = np.random.random((140000))
# print(a)
dataframe = pd.DataFrame({'Column1': a})

dataframe['random'] = a

HiggsMassList = [400,500,600,700,800,900,1000,1100]
x = [randrange(400,1100,100) for p in range(0, dataframe.shape[0])]

for i in range(300,1200,100):
    print("i = ", i, " occurance = ", x.count(i))


plt.figure();
plt.hist(x,bins=np.linspace(0,1200,12),
         histtype='step',color='midnightblue',label='signal')
# plt.hist(dataframe.mH,bins=np.linspace(400,1000,7),
#          histtype='step',color='firebrick',label='background')

plt.xlabel('mH [GeV]',fontsize=12);
plt.ylabel('Events',fontsize=12);
plt.suptitle('mH [GeV]', fontsize=20)

plt.legend(frameon=False);

```

    i =  300  occurance =  0
    i =  400  occurance =  19596
    i =  500  occurance =  19826
    i =  600  occurance =  20117
    i =  700  occurance =  20231
    i =  800  occurance =  19966
    i =  900  occurance =  20049
    i =  1000  occurance =  20215
    i =  1100  occurance =  0



![png](Prepare_csv_files/Prepare_csv_4_1.png)



```python
pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)

# fname = "/lustre/umt3/user/metsai/hbsm4top/Offline/SM4t-212830_HBSM4tops_newBDT_syst_offv4_official/mc16a/2lss3lge1mv2c10j/4tops.root"
fname = "/lustre/umt3/user/metsai/hbsm4top/Offline/SM4t-212830_HBSM4tops_newBDT_syst_offv4_official/mc16a/2lss3lge1mv2c10j/vh.root"
tree = uproot.open(fname)["nominal_Loose"]
EventID = uproot4.open(fname)["nominal_Loose"]

# Event ID
runNumber_arr = EventID["runNumber"].array(library="pd")
mcChannelNumber_arr = EventID["mcChannelNumber"].array(library="pd")
eventNumber_arr = EventID["eventNumber"].array(library="pd")

AllVariables=[
            'nJets',
            'nBTags_MV2c10_77',
            'mmm_Zveto',
            'emm_Zveto',
            'eem_Zveto',
            'eee_Zveto',
            'SSmm',
            'SSem_passECIDS',
            'SSee_passECIDS',
            'weight_normalise',
            'weight_mcweight_normalise',
            'weight_pileup',
            'weight_jvt',
            'mc_generator_weights',
            'weight_bTagSF_MV2c10_Continuous_CDI20190730',
            'weight_indiv_SF_EL_ChargeID',
            'weight_mc',
            'weight_leptonSF',
            'isSignalBkg'
            ]

variables = ['met_met','HT_all','deltaR_ll_sum','deltaR_ll_min','SphericityJets','SphericityXYJets']
VariablesList = [item for item in variables]
for var in range(len(VariablesList)):
    AllVariables.append( VariablesList[var] );

dataframe = tree.pandas.df(AllVariables,flatten=False)

dataframe["runNumber"] = runNumber_arr
dataframe["mcChannelNumber"] = mcChannelNumber_arr
dataframe["eventNumber"] = eventNumber_arr
# print(dataframe)

# combine the weights into one and then we can drop all nesty weights
# dataframe['weight'] = (36207.7*(dataframe.runNumber==284500)+44307.4*(dataframe.runNumber==300000)+(dataframe.runNumber==310000)*58450.1)*(1/138965.16)*dataframe.weight_normalise*dataframe.weight_mcweight_normalise.str[85]/dataframe.weight_mcweight_normalise.str[0]*dataframe.weight_pileup*dataframe.weight_jvt*dataframe.mc_generator_weights.str[85]*dataframe.weight_leptonSF*dataframe.weight_bTagSF_MV2c10_Continuous_CDI20190730*(dataframe.weight_indiv_SF_EL_ChargeID*(dataframe.SSee_passECIDS | dataframe.SSem_passECIDS)+1*(~(dataframe.SSee_passECIDS.astype(bool) | dataframe.SSem_passECIDS.astype(bool))).astype(int))
dataframe['weight'] = (36207.7*(dataframe.runNumber==284500)+44307.4*(dataframe.runNumber==300000)+(dataframe.runNumber==310000)*58450.1)*(1/138965.16)*dataframe.weight_normalise*dataframe.weight_pileup*dataframe.weight_jvt*dataframe.weight_mc*dataframe.weight_leptonSF*dataframe.weight_bTagSF_MV2c10_Continuous_CDI20190730*(dataframe.weight_indiv_SF_EL_ChargeID*(dataframe.SSee_passECIDS | dataframe.SSem_passECIDS)+1*(~(dataframe.SSee_passECIDS.astype(bool) | dataframe.SSem_passECIDS.astype(bool))).astype(int))

# See reference: https://stackoverflow.com/questions/30327417/pandas-create-new-column-in-df-with-random-integers-from-range
# Randomly assign Higgs masses for non-BSM 4tops samples
HiggsMassList = [400,500,600,700,800,900,1000]

mH_randomArray = [randrange(400,1100,100) for p in range(0, dataframe.shape[0])]
dataframe['mH'] = mH_randomArray

# Insert the correct Higgs masses for BSM 4tops samples
dataframe.loc[(dataframe['mcChannelNumber'] == 312440) , 'mH'] = 400
dataframe.loc[(dataframe['mcChannelNumber'] == 312441) , 'mH'] = 500
dataframe.loc[(dataframe['mcChannelNumber'] == 312442) , 'mH'] = 600
dataframe.loc[(dataframe['mcChannelNumber'] == 312443) , 'mH'] = 700
dataframe.loc[(dataframe['mcChannelNumber'] == 312444) , 'mH'] = 800
dataframe.loc[(dataframe['mcChannelNumber'] == 312445) , 'mH'] = 900
dataframe.loc[(dataframe['mcChannelNumber'] == 312446) , 'mH'] = 1000

print(dataframe)
# Drop the variables for the nesty weights
# WeightVariables = [ 'weight_normalise',
#                     'weight_mcweight_normalise',
#                     'weight_pileup',
#                     'weight_jvt',
#                     'mc_generator_weights',
#                     'weight_bTagSF_MV2c10_Continuous_CDI20190730',
#                     'weight_indiv_SF_EL_ChargeID',
#                     'weight_mc',
#                     'weight_leptonSF']
# dataframe = dataframe.drop(columns=WeightVariables)


# # Apply the selections (two-fold validation, even and odd)
# # See the intro: https://pandas.pydata.org/pandas-docs/stable/getting_started/intro_tutorials/03_subset_data.html
# Presel_df = Preselection(dataframe)

# # After preselection
# Variables=['nJets','nBTags_MV2c10_77','mmm_Zveto','emm_Zveto','eem_Zveto','eee_Zveto','SSmm','SSem_passECIDS','SSee_passECIDS','runNumber']
# Presel_df = Presel_df.drop(columns=Variables)
# # https://stackoverflow.com/questions/25649429/how-to-swap-two-dataframe-columns
# DefaultVar = ['eventNumber', 'isSignalBkg', 'weight', 'mH', 'mcChannelNumber']
# for var in range(len(DefaultVar)):
#     VariablesList.append( DefaultVar[var] );
# Presel_df=Presel_df.reindex(columns=VariablesList)

# # print("Presel_df = \n\n", Presel_df)

# # outputfolder = args.outputfolder
# # outputfile = args.outputfile
# # Presel_df.to_csv(outputfolder+outputfile)

```

           nJets  nBTags_MV2c10_77  mmm_Zveto  emm_Zveto  eem_Zveto  eee_Zveto  \
    entry
    0          2                 1          0          0          0          0
    1          1                 1          0          0          0          0
    2          2                 1          0          0          0          0
    3          1                 1          0          0          0          0
    4          1                 1          0          0          0          0
    5          1                 1          0          0          0          0
    6          4                 1          0          0          0          0
    7          1                 1          0          0          0          0
    8          2                 1          0          0          0          0
    9          1                 1          0          0          0          0
    10         1                 1          0          0          0          0
    11         1                 1          0          0          0          0
    12         2                 2          0          0          0          0
    13         5                 2          0          0          0          0
    14         2                 1          0          0          0          0
    15         2                 1          0          0          0          0
    16         3                 1          0          0          0          0
    17         1                 1          0          0          0          0
    18         2                 1          0          0          0          0
    19         2                 1          0          0          0          0
    20         2                 1          0          0          0          0

           SSmm  SSem_passECIDS  SSee_passECIDS  weight_normalise  \
    entry
    0         0               1               0          0.000014
    1         0               1               0          0.000014
    2         0               0               1          0.000014
    3         0               1               0          0.000014
    4         1               0               0          0.000014
    5         0               1               0          0.000014
    6         0               1               0          0.000014
    7         0               1               0          0.000014
    8         0               1               0          0.000014
    9         1               0               0          0.000014
    10        0               0               1          0.000014
    11        0               1               0          0.000014
    12        0               1               0          0.000009
    13        0               0               0          0.000009
    14        0               0               0          0.000009
    15        0               0               0          0.000009
    16        0               1               0          0.000009
    17        0               0               0          0.000009
    18        0               0               1          0.000009
    19        1               0               0          0.000009
    20        0               1               0          0.000009

          weight_mcweight_normalise  weight_pileup  weight_jvt  \
    entry
    0               [1.3800496e-05]       1.040258    0.966197
    1               [1.3800496e-05]       1.040258    0.994103
    2               [1.3800496e-05]       1.183654    0.977157
    3               [1.3800496e-05]       0.651527    0.982953
    4               [1.3800496e-05]       1.032648    0.994103
    5               [1.3800496e-05]       1.008581    1.000000
    6               [1.3800496e-05]       0.742007    0.943627
    7               [1.3800496e-05]       0.985139    1.000000
    8               [1.3800496e-05]       1.100541    0.989936
    9               [1.3800496e-05]       1.020371    0.994103
    10              [1.3800496e-05]       1.033192    1.000000
    11              [1.3800496e-05]       1.100541    0.982953
    12               [8.696023e-06]       0.835885    0.984098
    13               [8.696023e-06]       0.878693    0.924875
    14               [8.696023e-06]       1.020371    0.988241
    15               [8.696023e-06]       1.116819    0.977157
    16               [8.696023e-06]       1.008581    0.982413
    17               [8.696023e-06]       1.033192    0.968623
    18               [8.696023e-06]       1.189838    0.988241
    19               [8.696023e-06]       0.001000    0.952111
    20               [8.696023e-06]       1.020371    0.977157

          mc_generator_weights  weight_bTagSF_MV2c10_Continuous_CDI20190730  \
    entry
    0                    [1.0]                                     0.959040
    1                    [1.0]                                     1.053800
    2                    [1.0]                                     1.076922
    3                    [1.0]                                     1.015300
    4                    [1.0]                                     0.952200
    5                    [1.0]                                     0.816600
    6                    [1.0]                                     0.949346
    7                    [1.0]                                     0.960000
    8                    [1.0]                                     0.955044
    9                    [1.0]                                     0.952200
    10                   [1.0]                                     1.078000
    11                   [1.0]                                     1.218800
    12                   [1.0]                                     1.030568
    13                   [1.0]                                     0.947552
    14                   [1.0]                                     0.955044
    15                   [1.0]                                     0.979605
    16                   [1.0]                                     0.988021
    17                   [1.0]                                     1.218800
    18                   [1.0]                                     0.951248
    19                   [1.0]                                     0.942202
    20                   [1.0]                                     0.989010

           weight_indiv_SF_EL_ChargeID  weight_mc  weight_leptonSF  isSignalBkg  \
    entry
    0                         0.999450        1.0         0.964671          0.0
    1                         1.000270        1.0         0.941634          0.0
    2                         1.006971        1.0         0.941928          0.0
    3                         1.002110        1.0         0.882376          0.0
    4                         1.000000        1.0         0.966403          0.0
    5                         0.997060        1.0         0.967876          0.0
    6                         1.001870        1.0         0.950448          0.0
    7                         1.002010        1.0         0.968685          0.0
    8                         1.004410        1.0         0.952443          0.0
    9                         1.000000        1.0         0.978094          0.0
    10                        0.992739        1.0         0.919115          0.0
    11                        1.000110        1.0         0.929638          0.0
    12                        0.999790        1.0         0.959045          0.0
    13                        1.000830        1.0         0.936170          0.0
    14                        1.000000        1.0         0.977185          0.0
    15                        1.000830        1.0         0.967754          0.0
    16                        1.002160        1.0         0.978807          0.0
    17                        0.999450        1.0         0.971939          0.0
    18                        1.002100        1.0         0.928446          0.0
    19                        1.000000        1.0         0.990340          0.0
    20                        1.002810        1.0         0.979786          0.0

                 met_met         HT_all  deltaR_ll_sum  deltaR_ll_min  \
    entry
    0       74186.578125  173451.546875       0.400867       0.400867
    1       36557.207031  141680.796875       1.575788       1.575788
    2       61294.617188  182865.125000       2.752374       2.752374
    3       25703.498047  122770.031250       2.233053       2.233053
    4       14651.169922  331648.281250       2.764009       2.764009
    5      144766.921875  772476.437500       3.161644       3.161644
    6       39578.253906  355300.687500       2.510466       2.510466
    7       63732.730469  183103.718750       2.871073       2.871073
    8      147425.531250  285612.000000       3.185472       3.185472
    9       31118.167969  288899.812500       2.514630       2.514630
    10      50776.828125  103528.226562       0.976394       0.976394
    11      40305.187500  170044.453125       3.099617       3.099617
    12      35688.011719  168093.406250       2.624021       2.624021
    13       3404.940674  374887.312500       4.392360       0.575382
    14      37120.355469  317001.093750       4.522669       1.014232
    15      67258.757812  253466.375000       4.895865       1.174553
    16      32200.925781  346207.500000       2.951761       2.951761
    17      30575.998047  136152.234375       7.825338       2.508261
    18      54279.691406  340581.656250       3.551888       3.551888
    19      27212.130859  186420.250000       2.602618       2.602618
    20      31645.402344  297974.625000       2.633357       2.633357

           SphericityJets  SphericityXYJets  runNumber  mcChannelNumber  \
    entry
    0        5.555992e-01      6.548822e-02     284500           342284
    1        2.932404e-09      3.602117e-09     284500           342284
    2        2.500652e-01      1.646751e-01     284500           342284
    3        9.312350e-08      0.000000e+00     284500           342284
    4        5.792961e-08      4.308819e-08     284500           342284
    5       -3.451195e-09      0.000000e+00     284500           342284
    6        6.630414e-01      8.663917e-01     284500           342284
    7       -7.222606e-08      4.427803e-08     284500           342284
    8        1.456086e-02      1.091781e-01     284500           342284
    9       -4.516754e-08     -1.072281e-08     284500           342284
    10       1.113969e-08      0.000000e+00     284500           342284
    11       1.331109e-09      2.324247e-10     284500           342284
    12       4.664220e-01      5.765725e-01     284500           342285
    13       2.252924e-01      2.183652e-01     284500           342285
    14       8.033020e-02      3.899547e-01     284500           342285
    15       2.608316e-01      4.143496e-01     284500           342285
    16       1.702753e-01      4.281419e-02     284500           342285
    17      -1.110951e-09      0.000000e+00     284500           342285
    18       1.438134e-01      2.408370e-01     284500           342285
    19       4.599734e-02      8.743482e-01     284500           342285
    20       1.130502e-02      2.307921e-01     284500           342285

           eventNumber        weight   mH
    entry
    0            11189  3.341745e-06  800
    1            21261  3.690793e-06  700
    2            22784  4.248130e-06  500
    3            20781  2.067373e-06  700
    4            34019  3.396720e-06  400
    5            44801  2.857926e-06  600
    6            53787  2.275948e-06  500
    7            75678  3.300751e-06  500
    8            83561  3.579122e-06  700
    9            90235  3.396939e-06  700
    10           99431  3.654217e-06  900
    11           36911  4.407808e-06  800
    12           15333  1.841727e-06  600
    13           26871  1.633403e-06  800
    14           25366  2.132242e-06  500
    15           78823  2.344112e-06  800
    16           80141  2.175810e-06  700
    17           51118  2.686104e-06  700
    18           96355  2.357913e-06  900
    19           12052  2.013606e-09  600
    20           85423  2.195272e-06  800



```python

```


```python
plt.figure();
plt.hist(Presel_df.mH[Presel_df.isSignalBkg == 1],bins=np.linspace(400,1000,7),
         histtype='step',color='midnightblue',label='signal');
plt.hist(Presel_df.mH[Presel_df.isSignalBkg == 0],bins=np.linspace(400,1000,7),
         histtype='step',color='firebrick',label='background');

plt.xlabel('mH [GeV]',fontsize=12);
plt.ylabel('Events',fontsize=12);
plt.suptitle('mH [GeV]', fontsize=20)

plt.legend(frameon=False);

```
