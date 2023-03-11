# ITSM Integration & SLO Quality of Service

Foundations for deployment & configuration : [quickstart-ace-configurator](https://github.com/dynatrace-ace-services/quickstart-ace-configurator#readme)  
✅ ITSM integration & SLO Quality of Service : [easy-itsm-integration](https://github.com/dynatrace-ace-services/easy-itsm-integration#readme)  
Dashboarding Dynatrace Simply Smarter : [slo-simply-smarter](https://github.com/dynatrace-ace-services/slo-simply-smarter#readme)  

![image](https://user-images.githubusercontent.com/40337213/221264076-e188c8da-2762-46b1-a5b0-3bfba1512a5e.png)

## ITSM Integration : SLO real time alert 

Goal : be alerting immediatly on application and/or frontend services if there is a risk to miss the SLO.

- Create SLO for main application or main frontend services (but not for all)  
- Add SLO alert on fast burn rate
- Add SLO alert on error budget warning
- Create Alerting Profile on SLO alert
- Add ITSM notification without delay     
      - Critical for Fast Burn Rate  
      - Warning for Slow Burn Rate or Error Budget  


You can use these monaco templates [here](https://github.com/dynatrace-ace-services/easy-itsm-integration/tree/main/template_monaco) 

## ITSM Integration : Persistent problems

Goal : be alerting if the problem is persistant and not fix after X minutes. 

- Create a alerting profile with X min delay (between 15 min to 1 h)
- To define the best delay of X min for your production context, you can use the Anton's script.
- Add ITSM Integration based on this alerting profile. 

## Best practices 

- Configure Maintenance Windows to disable the notification of the ITSM integration.  
For example, if you know that your application will not be used during Bank Hollidays, create a maintenance window to avoid the alert `Application Low Traffic`
You can do that easily with monaco template (example for [French banck hollidays](https://github.com/dynatrace-ace-services/quickstart-ace-configurator/tree/main/Maintenance-Window))

- Don't modify the thresholds (expecpt may be Disk threshold and specific needs in particular cases), but leave Davis to deal with his baseline  

- Create the SLO to take advantage of the real time Burn Rate alerte. 

## Feedback loop : SLO Quality of Service
Targeted or Consolidated ? 

- Targeted SLO = Specific SLO for main application or frontend service (as described above)  
- Consolidated SLO = filtered by MZ. You can use the Simply Smarter with the SLO smarters which have been configured globaly by  tenant and can be filtered by MZ : click [here](https://github.com/dynatrace-ace-services/slo-simply-smarter#readme)  

![image](https://user-images.githubusercontent.com/40337213/221263913-2babc522-303f-4aa7-8cb4-90843c432769.png)


## Useful links
- Youtube : [Observability clinic : SLO](https://www.youtube.com/watch?v=r0Ce5AU7kRs)
- Youtube : [Boost your Service Desk integration with SLO](https://youtu.be/ugauVEjtfWo)  
- Tools : [sla-uptime](https://www.site24x7.com/fr/tools/sla-uptime.html)

# Next :

[template_monaco](/template_monaco)








