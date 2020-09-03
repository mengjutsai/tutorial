# Introduction
Here are variables which might be interesting.

## Sphericity
This sphericity in 3D is introduced [here](https://home.fnal.gov/~mrenna/lutp0613man2/node234.html) and sphericity in transverse plane is in [this paper](https://reader.elsevier.com/reader/sd/pii/S0375947414002267?token=06646AB57B2503954DD95502C1ECB78D4E76AE543390C439938F56C08140B4C221239122157077869BB3ED14E06EFE56).The sphericity provides measurement of the geometry of hadronic energy momentum flow. The sphericity is built from two smallest eigenvalues of normalized momentum tensor

$$
S^{\alpha\beta} =  \frac{\sum_{i} p_i^\alpha p_i^\beta}{\sum_{i} |\vec{p_i}|^2}
$$
where $$\alpha, \beta = 1, 2, 3$$ corresponds to the $$x$$, $$y$$ and $$z$$ components. By standard diagonalization of $$S^{\alpha \beta}$$ one may find three eigenvalues $$\lambda_1 \geq \lambda_2 \geq \lambda_3$$, with $$\lambda_1 + \lambda_2 + \lambda_3 = 1$$. The sphericity of the event is then defined as
$$
S = \frac{3}{2} \, (\lambda_2 + \lambda_3) ~,
$$
so that $$0 \leq S \leq 1$$. Sphericity is essentially a measure of the summed $$p_{\perp}^2$$ with respect to the event axis; a 2-jet event corresponds to $$S \approx 0$$ where only one axis is avaiable, and due to momentum conservation, the event becomes back-to-back. An isotropic event corresponds to $$S \approx 1$$.

The sphericity on the transverse plane is define as
$$
S = 2\frac{\lambda_1}{\lambda_1+\lambda_2} = 2\lambda_2
$$
where the momentum tensor is now a $$2\times 2$$ matrix, therefore, only two eigenvalues $$\lambda_1, \lambda_2$$. When $$S \approx 1$$, the event is more isotropic.
