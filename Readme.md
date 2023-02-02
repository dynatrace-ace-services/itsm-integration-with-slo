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


## Configure Maintenance Windows  

A maintenance window must be configured to disable the notification of the ITSM integration.
You have to do that for :  
- each change (ITIL process)
- not business period  

For example, if you know that your application will not be used during Bank Hollidays, create a maintenance window to avoid the alert `Application Low Traffic`
![image](https://user-images.githubusercontent.com/40337213/213878253-a7875502-dc8c-4d9e-9f47-89578ea7a56d.png)

You can do that easily with monaco here (you will find the monaco template for French banck hollidays) : 
https://github.com/dynatrace-ace-services/quickstart-ace-configurator/tree/main/Maintenance-Window

## 4) Create the auto-tag rules with `criticity level` (Optional)  
You can mapp the Dynatrace Service Model with the criticity level of your applications if you have them in your CMDB.  
These tags will be very important for the priorisation of the problem by your ITSM team.   
With Service Now, the criticity level Tag could be mapp automatically thanks to the transform mapp to the appropriate Service Desk team.  

Example, to adapt 
![image](https://user-images.githubusercontent.com/40337213/213879778-963c0bdd-f505-4db6-839c-b5c0af1b8d2a.png)

## No need to modify the threshod or the baseline configuration  
Exception for these cases :  

-  Error on User Action  
sometimes there are a lot of errors on User Action (javascript, or 401) without real impact on the user experience. In this case, after to be sure yan can't fix these errors on the application, you can diasblae the error from Apdex Calculation and from Davis : 
![image](https://user-images.githubusercontent.com/40337213/213878007-6ad4f145-3aa9-413b-bd5c-bbb016a03325.png)

- Adapt the Disk threshold to your context  
Sometime, you have to adapt the available disk space threshold to you context: 
prefer a global configuration on the tenant with a filter on the entities wit a specific TAG to apply your custom condition : 
![image](https://user-images.githubusercontent.com/40337213/213878888-f1b62ab5-9d52-4b4d-8bf1-1d223c9597a1.png)

## the golden rule of the ITSM integration with Dynatrace
- Don't modify the thresholds, but leave Davis to deal with his baseline  
- Create the SLO to take advantage of the Burn Rate alerte. 














