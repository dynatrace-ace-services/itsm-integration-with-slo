# Configure SLO alerts and ITM integration with template monaco


## 1) Prerequisites installation

- `Host Group` and `Management Zone` best practices with [Deployment best practices](https://github.com/dynatrace-ace-services/quickstart-ace-configurator)
-  Management Zone "application centric"

## 2) Create an `APi-Token` with this scope :

 - Access problem and event feed, metrics, and topology
 - Read configuration 
 - Write configuration
 - Read SLO
 - Write SLO
 
## 3)  `SLO burn alerts` with monaco template
 - Use [monaco](https://dynatrace-oss.github.io/dynatrace-monitoring-as-code/)
 
 `installation` (for linux x86)
 
    git clone https://github.com/dynatrace-ace-services/easy-itsm-integration
    cd easy-itsm-integration/template_monaco
    curl -L https://github.com/dynatrace/dynatrace-configuration-as-code/releases/download/v1.8.9/monaco-linux-386 -o monaco
    chmod +x monaco
       
`varaiables`

    export NEW_CLI=1
    export MyTenant=abcd123.live.dynatrace.com for saas or export MyTenant=domaine.com/e/abcd12234 for managed (without https://...) or 
    export MyToken=dt0c01.1234ABCD.XXXX

## 3) `SLO Burn alert` for each Managemennt Zone Application centric with monaco template  

`deploy` SLO Fast Burn alert and SLO erro budget warning alert for each MZ application centric   

    export mz_name=<mzName exists in the tenant>
    export slo_prefix=<mzName without space and special character, only [A-Za-z0-9]>
    
    ./monaco deploy -e=environments.yaml SLOburnalert_by_MZapplicationcetric
       
## 3) `ITSM integration` with monaco template  

`deploy` Alerting Profile for ITSM integration

     ./monaco deploy -e=environments.yaml ITSM_integration


Use this Alerting Profile in your Service Desk `notifiocation` rule. 


## SLO alert, default configurations:

![image](https://user-images.githubusercontent.com/40337213/221256100-a8e2bfe1-cf34-4b83-b0b2-5da6eac7cfc6.png)

![image](https://user-images.githubusercontent.com/40337213/221256632-e97f08c2-93ed-4edd-9c52-6838b9a1e765.png)

![image](https://user-images.githubusercontent.com/40337213/221256258-1a0f26a2-27b1-488c-8cfc-02b82c4a4417.png)

## ITSM integration, default configurations:

![image](https://user-images.githubusercontent.com/40337213/221258748-1c9be723-713c-4cb5-b336-d2bb7f433be0.png)

Use these `alerting profile`in the problem notification configuration of your ITSM integration.

## Useful links : 

- SRE best practices : https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/alerting-on-budget-burn-rate
