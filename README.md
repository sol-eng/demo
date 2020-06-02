# Demos

This repository hosts various example workflows inspired by insurance use cases.

## P&C

- `tpl_frequency/`: Frequency modeling example 
    - `report/`: Parameterized report that performs simple modeling and saves a
    predictive model, using [pins](https://pins.rstudio.com/), for use by others.
       - https://colorado.rstudio.com/rsc/connect/#/apps/4641/
    - `plumber/`: Deploys the model from the report above as an API.
       - https://colorado.rstudio.com/rsc/connect/#/apps/4638/
- [kasaai/uwdashboard](https://github.com/kasaai/uwdashboard): Automated deployment 
of an underwriting dashboard powered by Shiny and TensorFlow.
    - https://colorado.rstudio.com/rsc/uw-dashboard/

## Health

- [kasaai/largemedclaims](https://github.com/kasaai/largemedclaims): RMarkdown
and TensorFlow-powered plumber API for health claims analysis.
    - https://colorado.rstudio.com/rsc/med-claims-summary/sample_report.html
    - https://colorado.rstudio.com/rsc/large_claims_model/

## Reinsurance

- `quota_share/`: Very basic example illustrating a trivial treaty
    - `report/`: Minimal RMarkdown report
        - https://colorado.rstudio.com/rsc/quota_share_report/
    - `app/`: Minimal Shiny app
        - https://colorado.rstudio.com/rsc/quota_share_app/
