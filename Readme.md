# ITSM Integration - Best Practices

Deployment best practices : https://github.com/dynatrace-ace-services/quickstart-ace-configurator#readme  
✅ Easy ITSM integration : https://github.com/dynatrace-ace-services/easy-itsm-integration#readme  
SLO Simply Smarter : https://github.com/dynatrace-ace-services/slo-simply-smarter#readme  

## 1) Create an Alerting Profile `ITSM`  

here we distinguish between short-lived problems and long problems :  
- short live problems will be measured as week signal by SLO and treated  by the support level 3  
- long duration problems have to be send to the ITSM and treated immediatly by the Help Desk  
So we recommand to define an alerting profile with a delay like here to notify the long duration problems to the helps desk

![image](https://user-images.githubusercontent.com/40337213/213877403-f0318bcf-79f5-407e-90fe-eb1e52264e34.png)

## 2) Add Problem Notification  

With Service now, or with a webhook or with email ... the long duration problems will be sent to the help besk by this Problems Notification:  
![image](https://user-images.githubusercontent.com/40337213/213877803-35863688-813f-470b-a76e-1510deb8b085.png)

## 3) Configure Maintenance Windows  

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

- Adjust the error rate for service on the global tenant configuration : 
On production environment, you can modifiy this default configuration to be a littel less sensitive : 
![image](https://user-images.githubusercontent.com/40337213/213878638-e99c7398-88ce-4233-8caf-20c0d430440d.png)

- Adapt the Disk threshold to your context  
Sometime, you have to adapt the available disk space threshold to you context: 
prefer a global configuration on the tenant with a filter on the entities wit a specific TAG to apply your custom condition : 
![image](https://user-images.githubusercontent.com/40337213/213878888-f1b62ab5-9d52-4b4d-8bf1-1d223c9597a1.png)


## the golden rule of the ITSM with Dynatrace
- Don't modify the thresholds, but leave Davis to deal with his baseline  
- and just filter out the problems on the duration, impact level, severity, entities en tag to send for the ITSM notification.








