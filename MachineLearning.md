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



# Reference
More discussion on the XGBoost is listed here.

### Importance

- https://www.itread01.com/content/1545435380.html
- https://www.biaodianfu.com/feature-importance.html
- https://medium.com/jameslearningnote/%E8%B3%87%E6%96%99%E5%88%86%E6%9E%90-%E6%A9%9F%E5%99%A8%E5%AD%B8%E7%BF%92-%E7%AC%AC3-5%E8%AC%9B-%E6%B1%BA%E7%AD%96%E6%A8%B9-decision-tree-%E4%BB%A5%E5%8F%8A%E9%9A%A8%E6%A9%9F%E6%A3%AE%E6%9E%97-random-forest-%E4%BB%8B%E7%B4%B9-7079b0ddfbda
