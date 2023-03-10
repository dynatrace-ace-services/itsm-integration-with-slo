#Env file
export NEW_CLI=1 #don't modify
export MyTenant="xxx.dynatrace.com" #MyTenant=domain.managed.com/e/tenantid - without https://
export MyToken="yyy"
#need to be modify for each slo
export mz_name="my application - prod"
export slo_prefix="my_appli" #no space, no "-", no special character, only "az09_"
#default frontendservice_availability configuration
export frontendservice_availability_target=95
export frontendservice_availability_warning=98
export frontendservice_availability_burnrate=10
export frontendservice_availability_period="-1w"
#default application-performance configuration
export application_performance_target=85
export application_performance_warning=90
export application_performance_burnrate=10
export application_performance_period="-1w"
#default metric events
export application_performance_fastburnalert_enable="true"
export aapplication_performance_errorbudgetalert_enable="true"
export frontendservice_availability_fastburnalert_enable="true"
export frontendservice_availability_errorbudgetalert_enable="true"
