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
 
    git clone https://github.com/dynatrace-ace-services/itsm-integration-with-slo
    cd itsm-integration-with-slo/monaco-template
    curl -L https://github.com/dynatrace/dynatrace-configuration-as-code/releases/download/v1.8.9/monaco-linux-386 -o monaco
    chmod +x monaco
       
`env.sh` : open the `easy-itsm-integration/template_monaco/env.sh` file and setup the variables :  
 - export `MyTenant` = abcd123.live.dynatrace.com for saas or export MyTenant=domaine.com/e/abcd12234 for managed (without https://...)  
 - export `MyToken` = dt0c01.1234ABCD.XXXX with the scope described above  

`download` : backup the json configurations before starting
     
     . env.sh
     ./monaco download -e=environments.yaml -p=auto-tag,alerting-profile,anomaly-detection-metrics,slo backup

## 4) ITSM integration (only once)

`json` this template will create : 
 - alerting profile : `dt_ITSM_integration_SLO_alerts_notification` for burn rate alert 
 - alerting profile : `dt_ITSM_integration_problems_notification` with delay for persistent problems
 - auto tag : `dt_ITSM` for real time alert  
 - auto tag : `dt_SLO` on frontendservice used by the step 5)  

`env.sh` setup the variables   
- adjust the delay of alerting profile (optionnal)  

`deploy` run only once by tenant
 
       . env.sh
       ./monaco deploy -e=environments.yaml ITSM-integration

## 5) SLO alert (for each application based on management zone)

`json` this template will create :  
- SLO : `[slo_prefix] - application - performance` 
- SLO : `[slo_prefix] - frontendservice - availability`
- Metric Events : `[slo_prefix] - application - performance - fast burn alert` 
- Metric Events : `[slo_prefix] - frontendservice - availability - fast burn alert`

`env.sh` setup the variables   
- export `mz_name` = Management Zone name (for example "mz - name") 
- export `slo_prefix` = <MZ Name without space and special character or - or  space, only [AZaz09_] (for example "mz_name") 
- adjust the slo and metric events parameters (optionnal) 

`deploy` run for each MZ application centric   

      . env.sh
      ./monaco deploy -e=environments.yaml SLO-alerts
       
## 6) Alert notification

`configure` 2 alerts notifications to send Dynatrace Problems to your Service Desk tool based on these alerting profiles : 
- alerting profile : `dt_ITSM_integration_SLO_alerts_notification` for burn rate and error budget alerts 
- alerting profile : `dt_ITSM_integration_problems_notification` with delay for persistent problems

# 7) Results

Alert based on SLO fast burn rate : 
![image](https://user-images.githubusercontent.com/40337213/224493992-79f239e6-b6eb-462e-aa67-2bbbbd020cfa.png)

## SLO alert, default configurations:
SLO
![image](https://user-images.githubusercontent.com/40337213/221262130-2d2f0f7e-b650-4b63-8178-72566598b0ff.png)

Metric events
![image](https://user-images.githubusercontent.com/40337213/224962148-dc12548b-5b77-4611-a925-ae2ad27f6a7a.png)
 

Details
![image](https://user-images.githubusercontent.com/40337213/224930547-a64c2bdc-7e04-4b1d-b092-cb390bc47a9a.png)

![image](https://user-images.githubusercontent.com/40337213/224930849-5a41d8ef-ca82-4a24-bcc4-7a3ce49b4a96.png)

![image](https://user-images.githubusercontent.com/40337213/224931317-be620bf8-668d-4692-a98e-b16b6ff08f1b.png)


## ITSM integration, default configurations:

![image](https://user-images.githubusercontent.com/40337213/224931491-73e567a4-fab8-404b-89d5-280d64712f12.png)

Use these `alerting profile`in the problem `notifiocation` configuration of your ITSM integration.

## Useful links : 

SRE best practices : https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/alerting-on-budget-burn-rate
