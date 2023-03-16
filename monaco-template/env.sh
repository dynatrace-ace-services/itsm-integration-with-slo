#!/bin/bash
#Env file
  export NEW_CLI=1 #for monaco 1.0 - don t modify
  export MyTenant="xxx.live.dynatrace.com"      #Saas=> xxx.live.dynatrace.co, Managed=> domain.managed.com/e/tenantid - without https://
  export MyToken="yyy"                          #scope : Read_configuration, Write_configuration, Read_SLO & Write_SLO

#need to be modify for each slo
  export mz_name="Mz - name"
  #automatic slo_prefix naming -> 
  export slo_prefix=`echo $mz_name|tr '[:upper:]' '[:lower:]'|sed 'y/àçéèëêïîöôùüûÀÇÉÈËÊÏÎÖÔÙÜÛ/aceeeeiioouuuACEEEEIIOOUUU/'|sed -r 's/[^a-z0-9_]/_/g' | sed -r 's/^_//' | sed -r 's/__*/_/g'`
  #manual slo_prefix naming -> uncomment the line below
  #export slo_prefix="my_appli" #no space, no "-", no special character, only "az09_"
  
#default application-performance configuration
  export application_performance_target=85 #for apdex = 0.85,minimum value of a good apdex
  export application_performance_warning=90
  export application_performance_burnrate="3.5"
  export application_performance_period="-1w"
  
#default frontendservice_availability configuration
  export frontendservice_availability_target=95
  export frontendservice_availability_warning=98
  export frontendservice_availability_burnrate="3.5"
  export frontendservice_availability_period="-1w"

#default metric events
  export application_performance_fastburnalert_enable="false" #check the padex is >0,85 befaore enabling the event
  export frontendservice_availability_fastburnalert_enable="true"

#alerting profile
  export delay_for_real_time_alert=0 #minutes
  export delay_for_persitent_problem=60 #minutes

#Variables validation
echo MyTenant='https://'$MyTenant
echo MyToken=${MyToken:0:15}'...'
echo mz_name=$mz_name
echo slo_prefix=$slo_prefix
