# Easy ITSM Integration 

Deployment best practices : https://github.com/dynatrace-ace-services/quickstart-ace-configurator#readme  
✅ Easy ITSM integration : https://github.com/dynatrace-ace-services/easy-itsm-integration#readme  
SLO Simply Smarter installation : https://github.com/dynatrace-ace-services/slo-simply-smarter#readme  

Under construction 
![image](https://user-images.githubusercontent.com/40337213/216464677-d060b809-b785-4ddc-a056-cfba418ebbdf.png)

## ITSM Integration : SLO real time alert 

Goal : be alerting immediatly on application and/or frontend services if there is a risk to miss the SLO.

- Create SLO on appplication or frontend services
- Add SLO alert on Burn Rate
- Add SLO alert on Error Budget
- Create Alerting Profile on SLO alert
- Add ITSM notification without delay     
      - Critical for Burn Rate  
      - Error/Warning for Error Budget  

## ITSM Integration : Persistant alert

Goal : be alerting if the problem is persistant and not fix after X minutes. 

- Create a alerting profile with X min delay (between 15 min to 1 h)
- To define the best delay X min for the production context, you can use the Anton's script.
- Add ITSM Integration based on this alerting profile. 
![image](https://user-images.githubusercontent.com/40337213/213877403-f0318bcf-79f5-407e-90fe-eb1e52264e34.png)

## Others best practices 

- Configure Maintenance Windows to disable the notification of the ITSM integration.
For example, if you know that your application will not be used during Bank Hollidays, create a maintenance window to avoid the alert `Application Low Traffic`
![image](https://user-images.githubusercontent.com/40337213/213878253-a7875502-dc8c-4d9e-9f47-89578ea7a56d.png)

You can do that easily with monaco here (you will find the monaco template for French banck hollidays) : 
https://github.com/dynatrace-ace-services/quickstart-ace-configurator/tree/main/Maintenance-Window

- Adapt the Disk threshold to your context  
Sometime, you have to adapt the available disk space threshold to you context: 
prefer a global configuration on the tenant with a filter on the entities wit a specific TAG to apply your custom condition : 
![image](https://user-images.githubusercontent.com/40337213/213878888-f1b62ab5-9d52-4b4d-8bf1-1d223c9597a1.png)

- Don't modify the thresholds, but leave Davis to deal with his baseline  

- Create the SLO to take advantage of the Burn Rate alerte. 














