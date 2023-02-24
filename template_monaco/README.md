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
 
## 3) `Monaco`Import `SLO template`
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

## 3) Burn Alert for each Managemennt Zone Application centric with monaco template  

`deploy` SLO Fast Burn alert and SLO Slow Burn alert for each MZ application centric  

	export mz_name=<mzName exists in the tenant>
	export slo_prefix=<mzName without space and special character, only [A-Za-z0-9]>
    ./monaco deploy -e=environments.yaml SLOburnalert_by_MZapplicationcetric
       
## 3) ITSM integration with monaco template  

`deploy` Alerting Profile for ITSM integration

     ./monaco deploy -e=environments.yaml ITSM_integration


Use this Alerting Profile in your Service Desk `notifiocation` rule. 

