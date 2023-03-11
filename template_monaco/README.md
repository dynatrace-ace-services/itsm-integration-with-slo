# Configure SLO alerts and ITSM integration with template monaco

Create specifc SLO per management zone "Application Centric" on front entities for a real time alerting : 

![image](https://user-images.githubusercontent.com/40337213/221270094-5b08615b-aa8f-459c-8108-60582657e31f.png)

## 1) Prerequisites installation

- `Host Group` and `Management Zone` best practices with [Deployment best practices](https://github.com/dynatrace-ace-services/quickstart-ace-configurator)
-  Management Zone "application centric"

## 2) Create an `APi-Token` with this scope :

 - Access problem and event feed, metrics, and topology
 - Read configuration 
 - Write configuration
 - Read SLO
 - Write SLO
 
## 3)  Install monaco
 - Use [monaco](https://dynatrace-oss.github.io/dynatrace-monitoring-as-code/)
 
 `installation` (for linux x86)
 
    git clone https://github.com/dynatrace-ace-services/easy-itsm-integration
    cd easy-itsm-integration/template_monaco
    curl -L https://github.com/dynatrace/dynatrace-configuration-as-code/releases/download/v1.8.9/monaco-linux-386 -o monaco
    chmod +x monaco
       
`variables` : open the env.sh file en setup the variables : 
 
    export NEW_CLI=1
    export MyTenant=abcd123.live.dynatrace.com for saas or export MyTenant=domaine.com/e/abcd12234 for managed (without https://...) or 
    export MyToken=dt0c01.1234ABCD.XXXX

`backup` : backup json configuration before starting
     
     . env.sh
     ./monaco download -e=environments.yaml backup

## 4) ITSM integration (only once)

`deploy` Alerting Profile for ITSM integration 
This template will create : 
 - auto tag : `SLO` on frontendservice  
 - auto tag : `ITSM` on synthetic  
 - alerting profile : 
 

     ./monaco deploy -e=environments.yaml ITSM_integration

Use this Alerting Profile in your Service Desk `notification` rule. 

## 5) SLO alert (for each application based on management zone)

`deploy` SLO Fast Burn alert and SLO erro budget warning alert for each MZ application centric   

    export mz_name=<mzName exists in the tenant>
    export slo_prefix=<mzName without space and special character or - or  space, only [AZaz09_]>
    
    ./monaco deploy -e=environments.yaml SLO_alerts
       



## SLO alert, default configurations:
SLO
![image](https://user-images.githubusercontent.com/40337213/221262130-2d2f0f7e-b650-4b63-8178-72566598b0ff.png)

Metric events
![image](https://user-images.githubusercontent.com/40337213/221261839-49969b7e-bcd2-4761-bb1d-aeb4a03533cb.png)


Details
![image](https://user-images.githubusercontent.com/40337213/221256100-a8e2bfe1-cf34-4b83-b0b2-5da6eac7cfc6.png)

![image](https://user-images.githubusercontent.com/40337213/224392526-ea7277cd-5cd3-415b-a0d8-1fee4cf34b80.png)

![image](https://user-images.githubusercontent.com/40337213/221256258-1a0f26a2-27b1-488c-8cfc-02b82c4a4417.png)

## ITSM integration, default configurations:

![image](https://user-images.githubusercontent.com/40337213/224395171-a91776ac-4030-4ebc-bbba-419fdfbac8ee.png)

Use these `alerting profile`in the problem `notifiocation` configuration of your ITSM integration.

## Useful links : 

SRE best practices : https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/alerting-on-budget-burn-rate
