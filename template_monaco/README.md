# Configure SLO burn alerts and ITM integration with template monaco


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
 
 `installation` (example for linux x86)
 
    git clone https://github.com/dynatrace-ace-services/easy-itsm-integration
    cd easy-itsm-integration
    curl -L https://github.com/dynatrace/dynatrace-configuration-as-code/releases/download/v1.8.9/monaco-linux-386 -o monaco
    chmod +x monaco
       
`varaiables`

    export NEW_CLI=1
    export MyTenant=abcd123.live.dynatrace.com for saas or export MyTenant=domaine.com/e/abcd12234 for managed (without https://...) or 
    export MyToken=dt0c01.1234ABCD.XXXX

## 3) `SLO Burn alert` for each Managemennt Zone Application centric with monaco template  

`deploy` SLO Fast Burn alert and SLO Slow Burn alert for each MZ application centric  

	export mz_name=<mzName exists in the tenant>
	export slo_prefix=<mzName without space and special character, only [A-Za-z0-9]>
    ./monaco deploy -e=environments.yaml SLOburnalert_by_MZapplicationcetric
       
## 3) `ITSM integration` with monaco template  

`deploy` Alerting Profile for ITSM integration

     ./monaco deploy -e=environments.yaml ITSM_integration


Use this Alerting Profile in your Service Desk `notifiocation` rule. 



# SLO alerts : 
https://cloud.google.com/stackdriver/docs/solutions/slo-monitoring/alerting-on-budget-burn-rate

Fast Burn alert 
![image](https://user-images.githubusercontent.com/40337213/221123550-8e0731f6-4a29-40d1-8e73-e0f1501bcce6.png)

Slow Burn alert
![image](https://user-images.githubusercontent.com/40337213/221123607-61daa34b-dc0c-48b6-b5d0-0a8df210d147.png)

SRE recommandation and best practices
![image](https://user-images.githubusercontent.com/40337213/221123425-494fa29c-cabe-4c21-8401-3e97fedeeaef.png)
