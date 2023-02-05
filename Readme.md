# Easy ITSM Integration & SLO Quality of Service

Deployment best practices : https://github.com/dynatrace-ace-services/quickstart-ace-configurator#readme  
✅ Easy ITSM integration : https://github.com/dynatrace-ace-services/easy-itsm-integration#readme  
SLO Simply Smarter installation : https://github.com/dynatrace-ace-services/slo-simply-smarter#readme  

![image](https://user-images.githubusercontent.com/40337213/216789547-4bd74e88-d7fa-4897-aa2e-a4eb0ec98435.png)

## ITSM Integration : SLO real time alert 

Goal : be alerting immediatly on application and/or frontend services if there is a risk to miss the SLO.

- Create SLO for main application or main frontend services (but not for all)
      - Period 1 hour  
      - Define only 1 threshold : the SLO target for full Observability of your application.  
- Add SLO alert on Burn Rate
- Add SLO alert on Error Budget
- Create Alerting Profile on SLO alert
- Add ITSM notification without delay     
      - Critical for Burn Rate  
      - Warning for Error Budget  

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

## Feedback loop : SLO with Quality of Service

Configure a SLO for each Management Zone "application centric" : https://github.com/dynatrace-ace-services/quickstart-ace-configurator/blob/main/SLO/Readme.md
Or / and use the SLO Simply Smarter : https://github.com/dynatrace-ace-services/slo-simply-smarter#readme













