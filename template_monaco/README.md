# Configure SLO alerts and ITSM integration with template monaco

Create specifc SLO per management zone "Application Centric" on front entities for a real time alerting : 

![image](https://user-images.githubusercontent.com/40337213/221270094-5b08615b-aa8f-459c-8108-60582657e31f.png)

## 1) Prerequisites installation

- `Host Group` and `Management Zone` best practices with [Deployment best practices](https://github.com/dynatrace-ace-services/quickstart-ace-configurator)
-  Management Zone "application centric"

## 2) Create an `APi-Token` with this scope :

 - Read configuration 
 - Write configuration
 - Read SLO
 - Write SLO
 
## 3) Monaco installation
 - Use [monaco](https://dynatrace-oss.github.io/dynatrace-monitoring-as-code/)
 
 `installation` (for linux x86)
 
    git clone https://github.com/dynatrace-ace-services/easy-itsm-integration
    cd easy-itsm-integration/template_monaco
    curl -L https://github.com/dynatrace/dynatrace-configuration-as-code/releases/download/v1.8.9/monaco-linux-386 -o monaco
    chmod +x monaco
       
`env.sh` : open the `easy-itsm-integration/template_monaco/env.sh` file and setup the variables :  
 - export `MyTenant` = abcd123.live.dynatrace.com for saas or export MyTenant=domaine.com/e/abcd12234 for managed (without https://...)  
 - export `MyToken` = dt0c01.1234ABCD.XXXX with the scope described above  

`download` : backup the json configurations before starting
     
     . env.sh
     ./monaco download -e=environments.yaml backup

## 4) ITSM integration (only once)

`json` this template will create : 
 - alerting profile : `ITSM_integration_SLO_alerts_notification` for burn rate and error budget alerts 
 - alerting profile : `ITSM_integration_problems_notification` with delay for persistent problems
 - auto tag : `ITSM` on synthetic  
 - auto tag : `SLO` on frontendservice used by the step 5)  

`env.sh` setup the variables   
- adjust the delay of alerting profile (optionnal)  

`deploy` run only once by tenant
 
       . env.sh
       ./monaco deploy -e=environments.yaml ITSM_integration

## 5) SLO alert (for each application based on management zone)

`json` this template will create :  
- SLO : `[slo_prefix] - application - performance` 
- SLO : `[slo_prefix] - frontendservice - availability`
- Metric Events : `[slo_prefix] - application - performance - fast burn alert` 
- Metric Events : `[slo_prefix] - frontendservice - availability - fast burn alert`
- Metric Events : `[slo_prefix] - application - performance - error budget alert` 
- Metric Events : `[slo_prefix] - frontendservice - availability - error budget alert`

`env.sh` setup the variables   
- export `mz_name` = Management Zone name (for example "mz - name") 
- export `slo_prefix` = <MZ Name without space and special character or - or  space, only [AZaz09_] (for example "mz_name") 
- adjust the slo and metric events parameters (optionnal) 

`deploy` run for each MZ application centric   

      . env.sh
      ./monaco deploy -e=environments.yaml SLO_alerts
       
## 6) Alert notification

`configure` 2 alert notifications to send Dynatrace Problems to your Service Desk tool based on these alerting profiles : 
- alerting profile : `ITSM_integration_SLO_alerts_notification` for burn rate and error budget alerts 
- alerting profile : `ITSM_integration_problems_notification` with delay for persistent problems


## SLO alert, default configurations:
SLO
![image](https://user-images.githubusercontent.com/40337213/221262130-2d2f0f7e-b650-4b63-8178-72566598b0ff.png)

Metric events
![image](https://user-images.githubusercontent.com/40337213/221261839-49969b7e-bcd2-4761-bb1d-aeb4a03533cb.png)


Details
![image](https://user-images.githubusercontent.com/40337213/221256100-a8e2bfe1-cf34-4b83-b0b2-5da6eac7cfc6.png)

![image](https://user-images.githubusercontent.com/40337213/224392526-ea7277cd-5cd3-415b-a0d8-1fee4cf34b80.png)

![image](https://user-images.githubusercontent.com/40337213/224486018-381b8030-736f-43b6-9785-173389fec9a1.png)

## ITSM integration, default configurations:

![image](https://user-images.githubusercontent.com/40337213/224477342-f4861845-0c5b-4e37-804e-1e6910fca2ef.png)

Use these `alerting profile`in the problem `notifiocation` configuration of your ITSM integration.

## Useful links : 

SRE best practices : https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/alerting-on-budget-burn-rate
