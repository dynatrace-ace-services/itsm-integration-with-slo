# ITSM Integration & SLO Quality of Service

Foundations for deployment & configuration : [quickstart-ace-configurator](https://github.com/dynatrace-ace-services/quickstart-ace-configurator#readme)  
✅ ITSM integration & SLO Quality of Service : [itsm-integration-with-slo](https://github.com/dynatrace-ace-services/itsm-integration-with-slo#readme) & [monaco-template](https://github.com/dynatrace-ace-services/itsm-integration-with-slo/tree/main/monaco-template)  
Dashboarding Dynatrace Simply Smarter : [slo-simply-smarter](https://github.com/dynatrace-ace-services/slo-simply-smarter#readme)  

![image](https://user-images.githubusercontent.com/40337213/224924762-d9e46997-2395-414a-bbeb-722b48842e8c.png)

## ITSM Integration : SLO real time alert 

Goal : be alerting immediatly on application and/or frontend services if there is a risk to miss the SLO.

- Create SLO for main application or main frontend services (but not for all)  
- Add SLO alert on fast burn rate
- Create Alerting Profile on SLO alert
- Add ITSM notification without delay 


Monaco template for slo and itsm intgeration [here](https://github.com/dynatrace-ace-services/itsm-integration-with-slo/tree/main/monaco-template) 

## ITSM Integration : Persistent problems

Goal : be alerting if the problem is persistant and not fix after X minutes. 

- Create an alerting profile with X min delay (for example > 60 min)
- Add ITSM Integration based on this alerting profile. 

## Best practices 

- Configure Maintenance Windows to disable the notification of the ITSM integration.  
For example, if you know that your application will not be used during Bank Hollidays, create a maintenance window to avoid the alert `Application Low Traffic`
You can do that easily with monaco template (example for [French banck hollidays](https://github.com/dynatrace-ace-services/quickstart-ace-configurator/tree/main/Maintenance-Window))

- Don't modify the thresholds (expecpt may be Disk threshold and specific needs in particular cases), but leave Davis to deal with his baseline  

- Create the SLO to take advantage of the real time Burn Rate alerts. 

## Feedback loop : SLO Quality of Service

- SLO for real time alert =>  Specific SLO for main application or frontend service (as described above)  click [here](https://github.com/dynatrace-ace-services/itsm-integration-with-slo/tree/main/monaco-template) 
- SLO filtered by MZ => You can use the Simply Smarter with the SLO smarters which have been configured globaly by  tenant and can be filtered by MZ : click [here](https://github.com/dynatrace-ace-services/slo-simply-smarter#readme)  

![image](https://user-images.githubusercontent.com/40337213/224925027-3b6429c9-5479-4dc6-b0d9-15cd82cc048d.png)


## Useful links
- Youtube : [Observability clinic : SLO](https://www.youtube.com/watch?v=r0Ce5AU7kRs)
- Youtube : [Boost your Service Desk integration with SLO](https://youtu.be/ugauVEjtfWo)  
- Tools : [sla-uptime](https://www.site24x7.com/fr/tools/sla-uptime.html)

# Next :

[monaco-template](/monaco-template)








