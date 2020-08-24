# Introduction


# XGBoost

### Importance
We can get feature importance of each feature. This shows how the importance of variables to the BDT training.

```
xgb.plot_importance(booster,grid=False,importance_type='total_gain');
```

where `importance_type` can be different types (see official [doc](https://xgboost.readthedocs.io/en/latest/python/python_api.html#xgboost.Booster.get_score)):
 - `weight`: the number of times a feature is used to split the data across all trees. (features被使用的次數)
- `gain`: the average gain across all splits the feature is used in. (features平均收益)
- `cover`: the average coverage across all splits the feature is used in.
- `total_gain`: the total gain across all splits the feature is used in. (features總平均收益)
- `total_cover`: the total coverage across all splits the feature is used in.

More [discussion](https://www.itread01.com/content/1545435380.html) (in Chinese) on the XGBoost is discussed here.



# Installation
```
conda env create -f environment.yml
```

Activate the environment
```
 conda activate myenv
```


# Conda

### Removing an environment
```
conda env remove --name myenv
```


List the environment in the conda.
```
conda info --envs
```
