#!/bin/bash
#Env file
  export NEW_CLI=1 #for monaco 1.0 - don't modify
  export MyTenant="xxx.live.dynatrace.com" #Msaas=> xxx.live.dynatrace.co, Managed=> domain.managed.com/e/tenantid - without https://
  export MyToken="yyy" #scope : Read_configuration, Write_configuration, Read_SLO, Write_SLO, Access problem and event feed...

#need to be modify for each slo
  export mz_name="Mz - name"
  #automatic slo_prefix naming -> 
  export slo_prefix=`echo $mz_name|tr '[:upper:]' '[:lower:]'|sed 'y/àçéèëêïîöôùüûÀÇÉÈËÊÏÎÖÔÙÜÛ/aceeeeiioouuuACEEEEIIOOUUU/'|sed -r 's/[^a-z0-9_]/_/g' | sed -r 's/__*/_/g'`
  #manual slo_prefix naming -> uncomment the line below
  #export slo_prefix="my_appli" #no space, no "-", no special character, only "az09_"

#default application-performance configuration
  export application_performance_target=85
  export application_performance_warning=90
  export application_performance_burnrate=10
  export application_performance_period="-1w"

#default frontendservice_availability configuration
  export frontendservice_availability_target=95
  export frontendservice_availability_warning=98
  export frontendservice_availability_burnrate=10
  export frontendservice_availability_period="-1w"

#default metric events
  export application_performance_fastburnalert_enable="true"
  export application_performance_errorbudgetalert_enable="false"  #validate the apdex > 0.9 before enabling this alert
  export frontendservice_availability_fastburnalert_enable="true"
  export frontendservice_availability_errorbudgetalert_enable="true"

#alerting profile
  export delay_for_real_time_alert=0 #minutes
  export delay_for_persitent_problem=60 #minutes

#Variables validation
echo MyTenant='https://'$MyTenant
echo MyToken=${MyToken:0:20}'...'
echo mz_name=$mz_name
echo slo_prefix=$slo_prefix
