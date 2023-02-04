# Easy ITSM Integration 

Deployment best practices : https://github.com/dynatrace-ace-services/quickstart-ace-configurator#readme  
✅ Easy ITSM integration : https://github.com/dynatrace-ace-services/easy-itsm-integration#readme  
SLO Simply Smarter installation : https://github.com/dynatrace-ace-services/slo-simply-smarter#readme  

![image](https://user-images.githubusercontent.com/40337213/216784188-438c1d5b-787f-4983-ad4f-82380a01a0ff.png)

## ITSM Integration : SLO real time alert 

Goal : be alerting immediatly on application and/or frontend services if there is a risk to miss the SLO.

- Create SLO on appplication or frontend services
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














